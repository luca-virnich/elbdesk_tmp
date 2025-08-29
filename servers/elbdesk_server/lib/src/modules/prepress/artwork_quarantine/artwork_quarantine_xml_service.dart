import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';
import 'package:xml/xml.dart';

class ArtworkQuarantineXmlService {
  ArtworkQuarantineXmlService._();

  static const _rootElementName = 'artworkInfosAE2P42';

  /// Parses an XML file and returns the data model
  static Future<
      ({
        String artworkQuarantineUuid,
        ArtworkQuarantineAnalysisDataDTO analysisData
      })> parseXmlFile(
    String xmlContent,
    Session session,
  ) async {
    try {
      final document = ElbXmlHandler.parseXmlFromString(xmlContent);
      final rootElement = ElbXmlHandler.getRootElement(document);

      // Find the root element (artworkInfosAE2P42)

      if (ElbXmlHandler.getElementLocalName(rootElement) != _rootElementName) {
        throw ElbException(
          message: 'Invalid XML format: root element must be $_rootElementName',
          exceptionType: ElbExceptionType.fileOperationException,
        );
      }

      // Parse header section
      final headerElement = ElbXmlHandler.findFirstElement(
        rootElement,
        'header',
      );
      if (headerElement == null) {
        throw ElbException(
          message: 'Invalid XML format: header element not found',
          exceptionType: ElbExceptionType.fileOperationException,
        );
      }

      late final ArtworkQuarantineXMLResponseHeader headerData;
      try {
        headerData =
            ArtworkQuarantineXMLResponseHeader.fromXmlHeader(headerElement);
      } catch (e) {
        throw ElbException(
          message: 'Invalid XML format: header element invalid $e',
          exceptionType: ElbExceptionType.fileOperationException,
        );
      }

      // Parse format section
      final formatElement = rootElement.findElements('format').firstOrNull;
      final formatMetadata =
          formatElement != null ? _extractFormatMetadata(formatElement) : null;

      // Parse inks section
      final inksElement = rootElement.findElements('inks').firstOrNull;
      final colorSpecifications = inksElement != null
          ? _parseColorSpecificationsFromInks(inksElement, session)
          : <ColorSpecificationDTO>[];

      final analysisResult = ArtworkQuarantineAnalysisDataDTO(
        fileName: headerData.fileName,
        analysisDate: headerData.timeStamp,
        note: headerData.vmopNote,
        width: formatMetadata?.trimboxWidth,
        height: formatMetadata?.trimboxHeight,
        colorSpecifications: colorSpecifications,
      );

      return (
        artworkQuarantineUuid: headerData.artworkQuarantineUUID,
        analysisData: analysisResult,
      );
    } catch (e) {
      session.log(
        'Failed to parse XML: $e',
        level: LogLevel.error,
      );
      throw ElbException(
        message: 'Failed to parse XML: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Extracts metadata from the format section of the new XML format
  static ({double? trimboxWidth, double? trimboxHeight}) _extractFormatMetadata(
    XmlElement formatElement,
  ) {
    return (
      trimboxWidth:
          _parseDouble(_getElementText(formatElement, 'trimboxWidth')),
      trimboxHeight:
          _parseDouble(_getElementText(formatElement, 'trimboxHeight')),
    );
  }

  static List<ColorSpecificationDTO> _parseColorSpecificationsFromInks(
    XmlElement inksElement,
    Session session,
  ) {
    final inks = inksElement.findElements('ink').toList();
    final colorSpecs = <ColorSpecificationDTO>[];
    for (final ink in inks) {
      final name = _getElementText(ink, 'name')?.trim();
      if (name == null) continue;

      colorSpecs.add(
        ColorSpecificationDTO(
          name: name,
          type: _getElementText(ink, 'type'),
          book: _getElementText(ink, 'book'),
          egname: _getElementText(ink, 'egname'),
          frequency: _parseDouble(_getElementText(ink, 'frequency')),
          angle: _parseDouble(_getElementText(ink, 'angle')),
          dotshape: _getElementText(ink, 'dotshape'),
          r: _parseDouble(_getElementText(ink, 'rgbR')),
          g: _parseDouble(_getElementText(ink, 'rgbG')),
          b: _parseDouble(_getElementText(ink, 'rgbB')),
          attribute: _getElementText(ink, 'attribute'),
          printingmethod: _getElementText(ink, 'printingmethod'),
        ),
      );
    }
    return colorSpecs;
  }

  /// Parses inks from the new XML format structure
  static Future<List<ColorSpecificationDTO>> _parseInksFromNewFormat(
    XmlElement inksElement,
    Session session,
  ) async {
    try {
      // Extract all ink elements
      final inkElements = inksElement.findElements('ink').toList();

      // Extract all color names first for batch lookup
      final colorNames = inkElements
          .map((ink) => _getElementText(ink, 'name')?.trim())
          .where((name) => name != null && name.isNotEmpty)
          .cast<String>()
          .toSet();

      // Batch lookup all colors at once
      final colorMap = <String, ArtworkColorDTO>{};
      if (colorNames.isNotEmpty) {
        try {
          final colors = await ArtworkColorDTO.db.find(
            session,
            where: (t) => t.colorName.inSet(colorNames),
          );
          colorMap.addAll({
            for (final color in colors) color.colorName: color,
          });
        } catch (e) {
          session.log('Failed to lookup colors: $e', level: LogLevel.warning);
        }
      }

      // Build color specifications with pre-loaded database colors
      final specs = <ColorSpecificationDTO>[];
      for (final inkElement in inkElements) {
        final name = _getElementText(inkElement, 'name')?.trim();
        if (name == null) continue;

        specs.add(
          ColorSpecificationDTO(
            name: name,
            type: _getElementText(inkElement, 'type'),
            book: _getElementText(inkElement, 'book'),
            egname: _getElementText(inkElement, 'egname'),
            frequency: _parseDouble(_getElementText(inkElement, 'frequency')),
            angle: _parseDouble(_getElementText(inkElement, 'angle')),
            dotshape: _getElementText(inkElement, 'dotshape'),
            r: _parseDouble(_getElementText(inkElement, 'rgbR')),
            g: _parseDouble(_getElementText(inkElement, 'rgbG')),
            b: _parseDouble(_getElementText(inkElement, 'rgbB')),
            attribute: _getElementText(inkElement, 'attribute'),
            printingmethod: _getElementText(inkElement, 'printingmethod'),
            databaseColor: colorMap[name],
          ),
        );
      }

      return specs;
    } catch (e) {
      session.log(
        'Failed to parse inks from new format: $e',
      );
      return [];
    }
  }

  /// Gets the text content of an element
  static String? _getElementText(XmlElement element, String elementName) {
    return element.findElements(elementName).firstOrNull?.innerText.trim();
  }

  /// Parses a string to double, returning null if parsing fails
  static double? _parseDouble(String? value) {
    if (value == null) return null;
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }
}

class ArtworkQuarantineXMLResponseHeader {
  ArtworkQuarantineXMLResponseHeader({
    required this.timeStamp,
    required this.artworkQuarantineUUID,
    required this.vmopNote,
    required this.fileName,
  });

  factory ArtworkQuarantineXMLResponseHeader.fromXmlHeader(
    XmlElement headerElement,
  ) {
    final timeStampString =
        ElbXmlHandler.findFirstElementText(headerElement, 'timeStamp')!;

    return ArtworkQuarantineXMLResponseHeader(
      timeStamp: DateTime.parse(timeStampString),
      artworkQuarantineUUID: ElbXmlHandler.findFirstElementText(
        headerElement,
        'artworkQuarantineUUID',
      )!,
      vmopNote:
          ElbXmlHandler.findFirstElementText(headerElement, 'trimmedPdfNote')!,
      fileName: ElbXmlHandler.findFirstElementText(headerElement, 'fileName')!,
    );
  }
  final DateTime timeStamp;

  final String artworkQuarantineUUID;
  final String vmopNote;
  final String fileName;
}

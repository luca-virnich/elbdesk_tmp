import 'package:file_selector/file_selector.dart';
import 'package:xml/xml.dart';

Future<
    ({
      List<ColorImportColorSpecification> colorSpecifications,
      List<ColorObject> objects
    })> parseColorPaletteCxfFile({
  required XFile file,
}) async {
  final fileContent = await file.readAsString();

  // Parse the XML content
  final document = XmlDocument.parse(fileContent);

  // Define the namespace
  const ns = 'http://colorexchangeformat.com/CxF3-core';

  // Find all "Object" elements within the namespace
  final objectNodes = document.findAllElements('Object', namespace: ns);
  final objects = <ColorObject>[];
  final colorSpecifications = <ColorImportColorSpecification>[];
  final colorSpecificationNodes =
      document.findAllElements('ColorSpecification', namespace: ns);
  for (final node in colorSpecificationNodes) {
    final id = node.getAttribute('Id') ?? '';
    final illuminant = node.getAttribute('Illuminant') ?? '';
    final observer = node.getAttribute('Observer') ?? '';
    final method = node.getAttribute('Method') ?? '';
    final measurementType = node.getAttribute('MeasurementType') ?? '';
    final singleAngleConfiguration =
        node.getAttribute('SingleAngleConfiguration') ?? '';
    final illuminationAngle =
        double.tryParse(node.getAttribute('IlluminationAngle') ?? '') ?? 0.0;
    final measurementAngle =
        double.tryParse(node.getAttribute('MeasurementAngle') ?? '') ?? 0.0;
    final startWL = node.getAttribute('StartWL') ?? '';
    final increment = node.getAttribute('Increment') ?? '';
    final deviceFilter = node.getAttribute('DeviceFilter') ?? '';
    final devicePolarization = node.getAttribute('DevicePolarization') ?? '';
    colorSpecifications.add(
      ColorImportColorSpecification(
        id: id,
        illuminant: illuminant,
        observer: observer,
        method: method,
        measurementType: measurementType,
        singleAngleConfiguration: singleAngleConfiguration,
        illuminationAngle: illuminationAngle,
        measurementAngle: measurementAngle,
        startWL: startWL,
        increment: increment,
        deviceFilter: deviceFilter,
        devicePolarization: devicePolarization == 'true',
      ),
    );
  }

  // Iterate over the found object nodes and extract attributes
  for (final node in objectNodes) {
    final name = node.getAttribute('Name') ?? '';
    if (skipEntry(name)) {
      continue;
    }
    final id = node.getAttribute('Id') ?? '';
    final colorSpecification = node
            .getElement('ColorValues', namespace: ns)
            ?.getElement('ColorCIELab', namespace: ns)
            ?.getAttribute('ColorSpecification') ??
        '';
    final l = double.tryParse(
      node
              .getElement('ColorValues', namespace: ns)
              ?.getElement('ColorCIELab', namespace: ns)
              ?.getElement('L', namespace: ns)
              ?.text ??
          '',
    );
    final b = double.tryParse(
      node
              .getElement('ColorValues', namespace: ns)
              ?.getElement('ColorCIELab', namespace: ns)
              ?.getElement('B', namespace: ns)
              ?.text ??
          '',
    );
    final a = double.tryParse(
      node
              .getElement('ColorValues', namespace: ns)
              ?.getElement('ColorCIELab', namespace: ns)
              ?.getElement('A', namespace: ns)
              ?.text ??
          '',
    );
    final reflectanceSpectrumElement = node
        .getElement('ColorValues', namespace: ns)
        ?.getElement('ReflectanceSpectrum', namespace: ns);

    final startWL = reflectanceSpectrumElement?.getAttribute('StartWL');

    List<double>? reflectanceSpectrumValues;
    if (reflectanceSpectrumElement != null) {
      reflectanceSpectrumValues =
          reflectanceSpectrumElement.text.split(' ').map(double.parse).toList();
    }
    var shortName = '';
    final splitted = name.split(' ');
    if (splitted.length == 1) {
      shortName = splitted.first;
    } else {
      shortName = splitted[1];
    }
    // if (!name.contains('_')) {
    //   objects.add(
    //     ColorObject(
    //       name: name,
    //       shortName: shortName,
    //       id: id,
    //       l: l,
    //       b: b,
    //       a: a,
    //       colorSpecification: colorSpecification,
    //       reflectanceSpectrumValues: reflectanceSpectrumValues,
    //       startWL: startWL,
    //     ),
    //   );
    // }

    objects.add(
      ColorObject(
        name: name,
        shortName: shortName,
        id: id,
        l: l,
        b: b,
        a: a,
        colorSpecification: colorSpecification,
        reflectanceSpectrumValues: reflectanceSpectrumValues,
        startWL: startWL,
      ),
    );
  }

  return (colorSpecifications: colorSpecifications, objects: objects);
}

class ColorObject {
  ColorObject({
    required this.name,
    required this.shortName,
    required this.id,
    required this.l,
    required this.b,
    required this.a,
    required this.colorSpecification,
    required this.reflectanceSpectrumValues,
    required this.startWL,
  });

  final String name;
  final String shortName;
  final String id;
  double? l;
  double? b;
  double? a;
  final String? startWL;
  final String colorSpecification;
  final List<double>? reflectanceSpectrumValues;

  @override
  String toString() {
    return 'MyObject(name: $name, shortName: $shortName, id: $id, l: $l, '
        'b: $b, a: $a, startWL: $startWL, '
        'colorSpecification: $colorSpecification, '
        'reflectanceSpectrumValues: $reflectanceSpectrumValues)';
  }
}

class ColorImportColorSpecification {
  const ColorImportColorSpecification({
    required this.id,
    required this.illuminant,
    required this.observer,
    required this.method,
    required this.measurementType,
    required this.singleAngleConfiguration,
    required this.illuminationAngle,
    required this.measurementAngle,
    required this.startWL,
    required this.increment,
    required this.deviceFilter,
    required this.devicePolarization,
  });

  final String id;
  final String illuminant;
  final String observer;
  final String method;
  final String measurementType;
  final String singleAngleConfiguration;
  final double illuminationAngle;
  final double measurementAngle;
  final String startWL;
  final String increment;
  final String deviceFilter;
  final bool devicePolarization;

  @override
  String toString() {
    return 'ColorSpecification(id: $id, illuminant: $illuminant, '
        'observer: $observer, method: $method, '
        'measurementType: $measurementType, '
        'singleAngleConfiguration: $singleAngleConfiguration, '
        'illuminationAngle: $illuminationAngle, '
        'measurementAngle: $measurementAngle, '
        'startWL: $startWL, '
        'increment: $increment, '
        'deviceFilter: $deviceFilter, devicePolarization: $devicePolarization)';
  }
}

bool skipEntry(String name) {
  final endsWithUnderscoreAndThreeDigits = name.length >= 4 &&
      RegExp(r'_\d{3}$').hasMatch(name.substring(name.length - 4));
  final endsWithUnderscoreK = name.endsWith('_K');
  final endsWithUnderscoreG = name.endsWith('_G');

  return endsWithUnderscoreAndThreeDigits ||
      endsWithUnderscoreK ||
      endsWithUnderscoreG;
}

import 'dart:convert';
import 'dart:io';

import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_xml_handler.dart';
import 'package:elbdesk_server/src/web/routes/web_hook_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Webhook route for handling XML file uploads from AE
///
/// This route processes multipart form data containing XML files and uses
/// the ArtworkQuarantineXmlHandler to parse and validate the content
///
class AeDataEntryWebhookRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    // Validate authentication before processing any data
    final authenticated =
        await WebHookUtils.requireAuthentication(session, request);

    if (!authenticated) return true;

    // Validate content type to ensure proper multipart form data
    final validContentType = await WebHookUtils.validateContentType(
      expected: WebhookContentType.multipartFormData,
      request: request,
    );

    if (!validContentType) return true;

    try {
      // Process the XML file upload request
      await WebHookUtils.handleMultipartRequest<void>(
        request,
        (multipartData) => _processArtworkUpdateByXML(
          session,
          multipartData,
          request,
        ),
      );
    } catch (e) {
      return true;
    } finally {
      return true;
    }
  }

  /// Processes XML file data from multipart form data.
  ///
  /// Extracts required fields and processes the XML content using the
  /// ArtworkQuarantineXmlHandler.
  Future<void> _processArtworkUpdateByXML(
    Session session,
    Map<String, String> multipartData,
    HttpRequest request,
  ) async {
    // Extract and validate required form fields
    final fileContent = multipartData['file'];

    if (fileContent == null) {
      request.response.statusCode = HttpStatus.badRequest;
      request.response.write(
        jsonEncode({
          'success': false,
          'message': 'No file content provided',
        }),
      );
      await request.response.close();
      throw Exception('No file content provided');
    }

    try {
      // Update the artwork quarantine with the XML data
      // The handler will parse the XML and extract the quarantine ID
      await ArtworkQuarantineXmlHandler.updateArtworkWithAnalysis(
        session,
        fileContent,
      );
    } catch (e) {
      request.response.statusCode = HttpStatus.badRequest;
      request.response.write(
        jsonEncode({
          'success': false,
          'message':
              'Error processing XML with ArtworkQuarantineXmlHandler: $e',
        }),
      );
      await request.response.close();
      throw Exception(
        'Error processing XML with ArtworkQuarantineXmlHandler: $e',
      );
    }
  }
}

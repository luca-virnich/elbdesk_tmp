import 'dart:convert';
import 'dart:io';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:xml/xml.dart';

/// This is an example route which is used to demonstrate how to
/// handle webhooks from the service user.
/// It is used to receive XML files from the service user and process them.
/// It is also used to receive form data from the service user and process them.
class ServiceWebhookRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    // Check if user is authenticated
    final authInfo = await session.authenticated;
    final isAuthenticated = authInfo != null;

    if (!isAuthenticated) {
      request.response.statusCode = 401; // Unauthorized
      request.response.write('Authentication required');
      await request.response.close();
      return true;
    }

    print('AUTHENTICATED!');

    // Access request details
    final method = request.method;
    final uri = request.uri;
    final headers = request.headers;
    final contentType = headers['content-type']?.first ?? '';

    print('Content-Type: $contentType');

    try {
      if (contentType.startsWith('multipart/form-data')) {
        // Handle multipart form data
        await _handleMultipartRequest(session, request);
      } else {
        // Handle regular form data
        await _handleRegularRequest(session, request);
      }
    } catch (e) {
      print('Error handling request: $e');
      request.response.statusCode = 500;
      request.response.write(
        jsonEncode({
          'success': false,
          'message': 'Error processing request: $e',
        }),
      );
      await request.response.close();
    }

    return true; // Indicate that the request was handled
  }

  /// Handle multipart form data requests
  Future<void> _handleMultipartRequest(
    Session session,
    HttpRequest request,
  ) async {
    print('Handling multipart request...');

    final contentType = request.headers['content-type']?.first ?? '';
    final boundary = _extractBoundary(contentType);

    print('Boundary: $boundary');

    if (boundary == null) {
      request.response.statusCode = 400;
      request.response.write('Invalid multipart boundary');
      await request.response.close();
      return;
    }

    // Parse multipart data
    final multipartData = await _parseMultipartData(request, boundary);

    print('Parsed multipart data keys: ${multipartData.keys.toList()}');

    // Extract file content and filename
    final fileName = multipartData['fileName'] ?? 'unknown.xml';
    final fileContent = multipartData['file'];

    print('FileName: $fileName');
    print('FileContent length: ${fileContent?.length ?? 0}');

    if (fileContent != null) {
      print('XML Content:');
      print(fileContent);
    }

    if (fileContent == null) {
      request.response.statusCode = 400;
      request.response.write(
        jsonEncode({
          'success': false,
          'message': 'No file content provided',
        }),
      );
      await request.response.close();
      return;
    }

    // Process the XML file
    final result = await _processXmlFile(fileName, fileContent);

    // Return JSON response
    request.response.statusCode = 200;
    request.response.headers.set('Content-Type', 'application/json');
    request.response.write(jsonEncode(result));
    await request.response.close();
  }

  /// Handle regular form data requests
  Future<void> _handleRegularRequest(
    Session session,
    HttpRequest request,
  ) async {
    print('Handling regular request...');

    // Read the request body (for form data)
    final body = await Route.getBody(request);

    final id = body['id'];
    print(id);

    print('body: $body');
    print('method: ${request.method}');
    print('uri: ${request.uri}');
    print('headers: ${request.headers}');

    final internalSession = await session.serverpod.createSession();
    final field = await ServiceUserDTO.db.findFirstRow(internalSession);
    await internalSession.close();

    print('FIELD: ${field?.toJson()}');

    // Set your custom status code and response
    request.response.statusCode = 200;
    request.response.write('Webhook received');
    await request.response.close();
  }

  /// Extract boundary from content-type header
  String? _extractBoundary(String contentType) {
    final boundaryMatch = RegExp('boundary=([^;]+)').firstMatch(contentType);
    return boundaryMatch?.group(1);
  }

  /// Parse multipart form data
  Future<Map<String, String>> _parseMultipartData(
    HttpRequest request,
    String boundary,
  ) async {
    final data = <String, String>{};
    final body = <int>[];

    await for (final chunk in request) {
      body.addAll(chunk);
    }

    final bodyString = String.fromCharCodes(body);

    print('Raw body length: ${bodyString.length}');
    print('Boundary: --$boundary');

    // Split by boundary
    final parts = bodyString.split('--$boundary');
    print('Number of parts: ${parts.length}');

    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      print('Part $i length: ${part.length}');

      if (part.trim().isEmpty || part.trim() == '--') continue;

      // Parse each part
      final lines = part.split('\r\n');
      String? currentField;
      String? currentValue;

      print('Part $i lines: ${lines.length}');

      for (var j = 0; j < lines.length; j++) {
        final line = lines[j];

        if (line.startsWith('Content-Disposition:')) {
          // Extract field name
          final nameMatch = RegExp('name="([^"]+)"').firstMatch(line);
          currentField = nameMatch?.group(1);
          print('Found field: $currentField');
        } else if (line.trim().isEmpty && currentField != null) {
          // Empty line indicates start of content
          currentValue =
              lines.skip(j + 1).take(lines.length - j - 2).join('\r\n');
          print(
            'Found value for $currentField, length: ${currentValue.length}',
          );
          break;
        }
      }

      if (currentField != null && currentValue != null) {
        data[currentField] = currentValue;
      }
    }

    return data;
  }

  /// Process XML file content
  Future<Map<String, dynamic>> _processXmlFile(
    String fileName,
    String fileContent,
  ) async {
    try {
      // Parse the XML content
      final xmlDocument = XmlDocument.parse(fileContent);
      final rootElement = xmlDocument.rootElement;

      // Extract basic information
      final result = <String, dynamic>{
        'fileName': fileName,
        'rootElement': rootElement.name.toString(),
        'success': true,
        'message': 'XML file processed successfully',
        'attributes': rootElement.attributes
            .map(
              (attr) => {
                'name': attr.name.toString(),
                'value': attr.value,
              },
            )
            .toList(),
        'children': rootElement.children
            .whereType<XmlElement>()
            .map(
              (child) => {
                'name': child.name.toString(),
                'text': child.text,
              },
            )
            .toList(),
      };

      print('Processed XML file: $fileName');
      print('Root element: ${rootElement.name}');

      return result;
    } catch (e) {
      print('Error processing XML file: $e');
      return {
        'fileName': fileName,
        'success': false,
        'message': 'Error processing XML: $e',
      };
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';

/// Utility helpers for webhook routes.
class WebHookUtils {
  /// Checks whether the request is authenticated.
  ///
  /// Returns true when authenticated. If not authenticated, writes a
  /// 401 response and closes the response, then returns false.
  static Future<bool> requireAuthentication(
    Session session,
    HttpRequest request,
  ) async {
    final authInfo = await session.authenticated;
    final isAuthenticated = authInfo != null;

    if (!isAuthenticated) {
      request.response.statusCode = HttpStatus.unauthorized;
      request.response.write('Authentication required');
      await request.response.close();
      return false;
    }

    return true;
  }

  /// Parses the `Content-Type` header and returns a [WebhookContentType]
  static WebhookContentType detectContentType(HttpHeaders headers) {
    // The header content type could be: multipart/form-data; boundary=----abc123
    final contentTypeHeader = headers.contentType;
    final normalized = contentTypeHeader?.value.toLowerCase() ?? '';

    if (normalized.startsWith('multipart/form-data')) {
      return WebhookContentType.multipartFormData;
    }
    if (normalized.startsWith('application/json')) {
      return WebhookContentType.applicationJson;
    }
    if (normalized.startsWith('application/xml')) {
      return WebhookContentType.applicationXml;
    }
    if (normalized.startsWith('text/xml')) {
      return WebhookContentType.textXml;
    }
    if (normalized.startsWith('application/x-www-form-urlencoded')) {
      return WebhookContentType.formUrlEncoded;
    }

    return WebhookContentType.unknown;
  }

  /// Ensures the `Content-Type` header matches the expected
  /// [WebhookContentType]
  ///
  /// Returns true when it matches. If it doesn't match, writes a
  /// 400 response and closes the response, then returns false.
  static Future<bool> validateContentType({
    required WebhookContentType expected,
    required HttpRequest request,
  }) async {
    final headers = request.headers;
    final actual = detectContentType(headers);

    // We directly check for boundary in case of multipart/form-data
    if (expected == WebhookContentType.multipartFormData &&
        actual == WebhookContentType.multipartFormData) {
      final hasBoundary = await requireBoundary(request);
      return hasBoundary;
    }
    if (actual == expected) return true;

    // Write proper HTTP error response instead of throwing exception
    request.response.statusCode = HttpStatus.badRequest;
    request.response.write(
      'Invalid content type: expected ${expected.name}, got ${actual.name}',
    );
    await request.response.close();
    return false;
  }

  /// Ensures the request has a valid multipart boundary in the Content-Type
  /// header
  ///
  /// Returns the boundary string when valid, or null if no boundary is found.
  /// If no boundary is found, writes a 400 response and closes the response.
  static Future<bool> requireBoundary(HttpRequest request) async {
    final headers = request.headers;
    final boundary = headers.contentType?.parameters['boundary'];

    if (boundary == null || boundary.isEmpty) {
      request.response.statusCode = HttpStatus.badRequest;
      request.response.write('Invalid multipart boundary');
      await request.response.close();
      return false;
    }
    return true;
  }

  /// We are getting the boundary from the contenttype multipart/form-data
  /// When using this you need to check if the boundary is not null or empty
  static String getBoundary(ContentType contentType) {
    final boundary = contentType.parameters['boundary'];
    return boundary!;
  }

  /// Parses multipart form data from the request body.
  static Future<Map<String, String>> parseMultipartData(
    HttpRequest request,
    String boundary,
  ) async {
    final data = <String, String>{};
    final body = <int>[];

    // Read the entire request body as chunks
    await for (final chunk in request) {
      body.addAll(chunk);
    }

    // Convert body chunks to string for parsing
    final bodyString = String.fromCharCodes(body);

    // Split the body by multipart boundary to separate form fields
    final parts = bodyString.split('--$boundary');

    // Process each part to extract field names and values
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];

      // Skip empty parts and final boundary marker
      if (part.trim().isEmpty || part.trim() == '--') continue;

      // Parse the part header and content
      final lines = part.split('\r\n');
      String? currentField;
      String? currentValue;

      // Extract field name from Content-Disposition header
      for (var j = 0; j < lines.length; j++) {
        final line = lines[j];

        if (line.startsWith('Content-Disposition:')) {
          // Extract field name using regex pattern
          final nameMatch = RegExp('name="([^"]+)"').firstMatch(line);
          currentField = nameMatch?.group(1);
        } else if (line.trim().isEmpty && currentField != null) {
          // Empty line indicates start of field content
          // Extract all remaining lines as the field value
          currentValue =
              lines.skip(j + 1).take(lines.length - j - 2).join('\r\n');
          break;
        }
      }

      // Store the extracted field name and value
      if (currentField != null && currentValue != null) {
        data[currentField] = currentValue;
      }
    }

    return data;
  }

  /// Generic handler for multipart form data requests.
  ///
  /// Extracts the boundary, parses the data, and calls the provided processor
  /// function with the parsed data. Handles common error cases.
  static Future<void> handleMultipartRequest<T>(
    HttpRequest request,
    Future<T?> Function(Map<String, String> multipartData) processor,
  ) async {
    final boundary = getBoundary(request.headers.contentType!);

    try {
      // Parse the multipart form data into field names and values
      final multipartData = await parseMultipartData(request, boundary);

      // Process the data using the provided processor function
      final result = await processor(multipartData);

      // Return successful response
      request.response.statusCode = HttpStatus.ok;
      request.response.headers.set('Content-Type', 'application/json');
      request.response.write(jsonEncode(result));
      await request.response.close();
    } catch (e) {
      rethrow;
    }
  }
}

/// Supported webhook content types.
enum WebhookContentType {
  multipartFormData,
  applicationJson,
  applicationXml,
  textXml,
  formUrlEncoded,
  unknown,
}

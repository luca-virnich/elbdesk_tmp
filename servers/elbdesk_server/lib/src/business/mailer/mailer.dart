import 'dart:convert';

import 'package:http/http.dart' as http;

class Mailer {
  const Mailer({
    required String host,
    required String projectId,
    required String apiToken,
  })  : _host = host,
        _projectId = projectId,
        _apiToken = apiToken;

  final String _host;
  final String _projectId;
  final String _apiToken;

  Future<bool> sendRegistrationEmail({
    required String registrarEmail,
    required String registrantEmail,
    required String password,
  }) async {
    final url = Uri.parse('$_host/send-mail/send-registration-email');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-project-id': _projectId,
      'x-api-key': _apiToken,
    };

    final body = jsonEncode({
      'registrarEmail': registrarEmail,
      'registrantEmail': registrantEmail,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendValidationEmail({
    required String email,
    required String validationCode,
  }) async {
    final url = Uri.parse('$_host/send-mail/send-validation-email');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-project-id': _projectId,
      'x-api-key': _apiToken,
    };

    final body = jsonEncode({
      'validationEmail': email,
      'validationCode': validationCode,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendPasswordResetEmail({
    required String email,
    required String validationCode,
  }) async {
    final url = Uri.parse('$_host/send-mail/send-password-reset-email');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-project-id': _projectId,
      'x-api-key': _apiToken,
    };

    final body = jsonEncode({
      'email': email,
      'validationCode': validationCode,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

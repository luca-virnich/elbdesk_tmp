import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:elbdesk_core/src/service/updater/updater.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response<Uint8List> {}

void main() {
  setUpAll(() {
    // Register fallback value for Uri
    registerFallbackValue(Uri.parse('https://example.com'));
  });

  group('UpdateDownloader', () {
    late MockDio mockDio;
    late MockResponse mockResponse;
    final testUrl = Uri.parse('https://packages.coe.elbdesk.cloud/test.txt');
    final testBytes = Uint8List.fromList([1, 2, 3, 4, 5]);

    setUp(() {
      mockDio = MockDio();
      mockResponse = MockResponse();

      // Set up default successful response
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(testBytes);
    });

    test('downloads file successfully', () async {
      when(
        () => mockDio.getUri<Uint8List>(
          any(),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await UpdateDownloader.download(
        url: testUrl,
        client: mockDio,
      );

      // Verify the result
      expect(result, equals(testBytes));

      // Single verification to capture and check everything
      final verification = verify(
        () => mockDio.getUri<Uint8List>(
          captureAny(),
          options: captureAny(named: 'options'),
          onReceiveProgress: null,
        ),
      )..called(1);

      // Get captured values
      final capturedUri = verification.captured[0] as Uri;
      final capturedOptions = verification.captured[1] as Options;

      // Verify URI
      expect(capturedUri.toString(), equals(testUrl));

      // Verify auth header
      final expectedAuth =
          'Basic ${base64Encode(utf8.encode('appahoiadmin:TheOneAndOnlyAppAhoi'))}';
      expect(capturedOptions.headers?['Authorization'], equals(expectedAuth));
    });

    test('handles null response data', () async {
      when(() => mockResponse.data).thenReturn(null);
      when(() => mockResponse.statusMessage).thenReturn('No data');
      when(
        () => mockDio.getUri<Uint8List>(
          any(),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      expect(
        () => UpdateDownloader.download(url: testUrl),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Failed to download file with status code: 200'),
          ),
        ),
      );
    });

    test('handles non-200 status code', () async {
      when(() => mockResponse.statusCode).thenReturn(404);
      when(() => mockResponse.statusMessage).thenReturn('Not Found');
      when(
        () => mockDio.getUri<Uint8List>(
          any(),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((_) async => mockResponse);

      expect(
        () => UpdateDownloader.download(url: testUrl),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Failed to download file with status code: 404'),
          ),
        ),
      );
    });

    test('reports download progress', () async {
      final progressUpdates = <(int, int)>[];

      when(
        () => mockDio.getUri<Uint8List>(
          any(),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer((invocation) {
        final onProgress = invocation.namedArguments[#onReceiveProgress] as void
            Function(int, int)?;
        onProgress?.call(50, 100); // Simulate 50% progress
        return Future.value(mockResponse);
      });

      await UpdateDownloader.download(
        url: testUrl,
        onReceiveProgress: (received, total) {
          progressUpdates.add((received, total));
        },
      );

      expect(progressUpdates, [(50, 100)]);
    });

    test('closes client even when request fails', () async {
      when(
        () => mockDio.getUri<Uint8List>(
          any(),
          options: any(named: 'options'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenThrow(Exception('Network error'));

      expect(
        () => UpdateDownloader.download(url: testUrl),
        throwsA(isA<Exception>()),
      );

      verify(() => mockDio.close()).called(1);
    });
  });
}

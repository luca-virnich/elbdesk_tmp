import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'updates_logic.g.dart';

@riverpod
class NewestAppVersionManifest extends _$NewestAppVersionManifest {
  @override
  Future<AppVersionManifest> build() async {
    final endpoint = EndpointAppVersion(
      ElbDeskCore.client,
    );
    ref.listen(watchAppVersionUpdatesProvider, (previous, next) {
      if (next.hasValue) {
        state = next;
      }
    });

    final version = await endpoint.fetchLatestAppVersionManifest();
    return state.value ?? version;
  }
}

@riverpod
Stream<AppVersionManifest> watchAppVersionUpdates(Ref ref) async* {
  final endpoint = EndpointAppVersion(
    ElbDeskCore.client,
  );
  final streamHelper =
      ServerpodStreamManager<AppVersionManifest, AppVersionManifest>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: endpoint.watchAppVersionUpdates,
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog('Error occurred in streamAppVersionUpdates: $error');
    },
  );
}

@riverpod
AppUpdateRepository appUpdateRepository(Ref ref) {
  final endpoint = EndpointAppVersion(
    ElbDeskCore.client,
  );
  return AppUpdateRepository(
    endpoint: endpoint,
  );
}

class AppUpdateRepository {
  AppUpdateRepository({required this.endpoint});

  final EndpointAppVersion endpoint;

  Future<void> update({
    required Uri url,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final fileName = url.pathSegments.last;
    final tempDir = Directory.systemTemp.createTempSync();
    final tempFile = File('${tempDir.path}\\$fileName');
    final credentials = await requestCredentials();
    final bytes = await downloadUpdate(
      url: url,
      credentials: credentials,
      onReceiveProgress: onReceiveProgress,
    );

    await tempFile.writeAsBytes(bytes);
    await Installer.install(msixPath: tempFile.path);
  }

  Future<String> requestCredentials() async {
    final credentials = await endpoint.requestCredentials();
    final encodedCredentials = base64Encode(utf8.encode(credentials));
    return encodedCredentials;
  }

  Future<Uint8List> downloadUpdate({
    required Uri url,
    required String credentials,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final dio = Dio();

    // Add basic auth credentials
    final basicAuth = 'Basic $credentials';

    try {
      final response = await dio.getUri<Uint8List>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': basicAuth,
          },
        ),
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw ElbException(
            exceptionType: ElbExceptionType.unknown,
            message: 'Failed to download file',
          );
        }
        return response.data!;
      }
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: 'Failed to download file',
      );
    } catch (e) {
      dlog(e);
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: 'Failed to download file',
      );
    } finally {
      dio.close();
    }
  }
}

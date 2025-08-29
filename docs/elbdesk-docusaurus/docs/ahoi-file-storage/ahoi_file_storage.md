---
sidebar_position: 2
title: Ahoi File Storage
---

# Adding Ahoi File Storage to a Serverpod project

![Hetzner](/img/ahoi_file_storage.png)

## Introduction

To use Ahoi File Storage we need include it and initialize it in our Serverpod project

## Adding ahoi_file_storage dependency to the server

In your server's `pubspec.yaml` file add `ahoi_file_storage` dependency from git, make sure to use the commit ref to pin the version in place in order for dependency to stay fixed in your server project even if it changes in its Git repository.

```yaml
dependencies:
  ahoi_file_storage:
    git:
      url: https://github.com/App-Ahoi/ahoi_file_storage.git
      ref: 4998e3bbdcfdadab2a95ee85bc2c8de22dabd5a1
```

## Add ahoi_file_storage config variables in passwords.yaml

In order for ahoi_file_storage to be successfully intialised it requires the following config variables to be availablae in each environment:

- **AFSAccessKeyId** - Generated AFSAccessId that's also used on the Serverpod and Serverpod Client side for request signing
- **AFSSecretKey** - Generated AFSSecretKey that's also used on the Serverpod and Serverpod Client side for request signing
- **cloudStorageHost** - the full domain or ip address where our ahoi_file_storage_server api is listening
- **cloudStorageScheme** - the version of http protocol that our server supports http or https
- **cloudStoragePublicHost** - the full domain or ip address where our ahoi_file_storage_server api is listening
- **cloudStoragePublicScheme** - the version of http protocol that our server supports http or https

In your Serverpd server's `password.yaml` file add the following configurations (replace the values with the ones required for your project):

```yaml
# Save passwords used across all configurations here.
shared:
  # Cloud Storage
  AFSAccessKeyId: 'appahoiAccessKeyId'
  AFSSecretKey: 'appahoiSecretKey'

# These are passwords used when running the server locally in development mode
development:
  # Cloud Storage
  cloudStorageHost: 'localhost:8600'
  cloudStorageScheme: 'http'
  cloudStoragePublicHost: 'localhost:8600'
  cloudStoragePublicScheme: 'http'

test:
  cloudStorageHost: 'fs.coe.elbdesk.cloud'
  cloudStorageScheme: 'https'
  cloudStoragePublicHost: 'fs.coe.elbdesk.cloud'
  cloudStoragePublicScheme: 'https'

# Passwords used in your staging environment if you use one. The default setup
# use a password for Redis.
staging:
  cloudStorageHost: 'fs.coe.elbdesk.cloud'
  cloudStorageScheme: 'https'
  cloudStoragePublicHost: 'fs.coe.elbdesk.cloud'
  cloudStoragePublicScheme: 'https'

# Passwords used in production mode.
production:
  cloudStorageHost: 'fs.coe.elbdesk.cloud'
  cloudStorageScheme: 'https'
  cloudStoragePublicHost: 'fs.coe.elbdesk.cloud'
  cloudStoragePublicScheme: 'https'
```

## Initialize AhoiFileStorage in the Serverpod server

In order for serverpod to be able to use our implementation of the CloudStorage we need to initialise `AhoiFileStorage` in the `server.dart` `run` function of our Serverpod server project.

In serverpod we do that by invoking the `Serverpod.addCloudStorage(...)` method like in the following example:

```dart
Future<void> run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  pod.addCloudStorage(
      AhoiFileStorage(
        host: pod.getPassword('cloudStorageHost'),
        publicHost: pod.getPassword('cloudStoragePublicHost'),
        isLocal: pod.commandLineArgs.runMode == ServerpodRunMode.development,
        serverpod: pod,
        storageId: 'private',
        public: false,
        region: 'eu-central-1',
        bucket: pod.commandLineArgs.runMode,
      ),
    );


  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );
  await pod.start();
}
```

Now that we have provided our implementation of the Serverpod CloudStorage, we can use the Serverpod's cloud storage methods to do file storage related operations on the server.

## AhoiFileStorage usage

After you've sucessfully configured and initialized AhoiFileStorage, you can now use it's server size methods to do the following operations:

To get the upload description and return it in the json string form use:

- This is used by `ahoi_file_storage_client` on the flutter app side to securely upload the file from the memory or the storage of the device where the flutter app is running to the Ahoi File Storage Server vps instance.

```dart
Future<String?> getUploadDescription(Session session, String path) async {
    final uploadDescription =
        await session.storage.createDirectFileUploadDescription(
      // TODO(kz): figure out how public/private works and implement it
      storageId: 'private',
      path: path,
    );

    return uploadDescription;
  }
```

To verify that the file exists in the bucket and return `true` or `false` do:

- This is used to verify that the file has been uploaded succesfully in case the server is not returning a success or failure response after the upload request.

```dart
Future<bool> verifyUpload(Session session, String path) async {
    return session.storage.verifyDirectFileUpload(
      storageId: 'private',
      path: path,
    );
  }
```

To delete a file and return success `bool` use:

```dart
Future<bool> deleteFile(Session session, String path) async {
    await session.storage.deleteFile(
      storageId: 'private',
      path: path,
    );

    final isDeleted = !await session.storage.fileExists(
      storageId: 'private',
      path: path,
    );

    return isDeleted;
  }
```

To create a signed download URL and return it as string use:

- This is used by `ahoi_file_storage_client` on the flutter app side to securely download the file into the memory of the device where the flutter app is running.
- This returns a signed URL with the expiration time of 15 minutes (by default).

```dart
Future<String> getDownloadUrl(Session session, String path) async {
    final downloadUrl = await session.storage.getPublicUrl(
      storageId: 'private',
      path: path,
    );
    final downloadUrlString = downloadUrl.toString();

    return downloadUrlString;
  }
```

To get download description and return it in the json string form use:

```dart
Future<String?> getDownloadDescription(Session session, String path) async {
    final downloadDescription =
        await session.storage.createDirectFileDownloadDescription(
      session: session,
      storageId: 'private',
      path: path,
    );

    return downloadDescription;
  }
```

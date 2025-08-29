
# AsyncHandler Class Documentation

The `AsyncHandler` class provides a utility for handling asynchronous operations in a Flutter application. It wraps around a future operation and handles various exceptions, displaying notifications to the user based on the result.

## Table of Contents

- [handleAsyncOperation Function](#handleasyncoperation-function)

## handleAsyncOperation Function

### Definition

```dart
static Future<({bool success, String? errorMessage, T? data})> handleAsyncOperation<T>(
  BuildContext context,
  Future<T?> Function() operation, {
  GlobalKey<NavigatorState>? errorNavigatorKey,
  GlobalKey<NavigatorState>? successNavigatorKey,
  bool showErrorNotification = true,
  String? successMessage,
})
```

### Parameters

- `context`: The `BuildContext` of the widget. It is required to show notifications using `AppNotificationOverlay`.
- `operation`: A function that returns a `Future<T?>`, which represents the async operation to be executed.
- `errorNavigatorKey`: An optional `GlobalKey<NavigatorState>` used to show the Error-Message in the correct Navigator Stack.
- `successNavigatorKey`: An optional `GlobalKey<NavigatorState>` used to show the Success-Message in the correct Navigator Stack.
- `successMessage`: An optional message to display on success.

### Return Value

The function returns a tuple containing:

- `success`: A boolean indicating whether the operation was successful or not.
- `errorMessage`: A string with an error message if the operation failed, or `null` if successful.
- `data`: The result of the operation if successful, or `null` if it failed.

### Description

The `handleAsyncOperation` function is designed to handle asynchronous operations in a structured manner. It tries to execute the provided `operation` and handles different exceptions with appropriate notifications.

#### Success Handling

If the operation succeeds and a `successMessage` is provided, a success notification is shown using `AppNotificationOverlay.success` in the provided successNavigator. If no Navigator is provided, the rootNavigator is used.

#### Error Handling

Different exceptions are caught and handled separately:

- **ElbException**: Displays a custom error message from the exception.

  Whenever possible, the Server should return an ElbException with an explanatory value (ExceptionValue enum).

  The correct translation to a human readable value takes place in the `elb_exception_extension.dart`.

  You can hide a Error-Overlay on an ElbException when passing `showErrorNotification` false.


- **HiddenException**: Returns a generic error without notifying the user.

  This Error-Type will never show an Overlay, you can use it for handling error-Messages in the Main-UI like a Validation-Error on a TextField.

- **UnhandledException**: Returns a general failure message without specific error details.
- **Generic Error**: Any other errors are caught by the generic `catch` block and display a server error message.

In all cases, the success status, error message, and data are returned as part of the result.

### Example

```dart
final result = await AsyncHandler.handleAsyncOperation<MyData>(
  context,
  myAsyncOperation,
  successMessage: 'Operation completed successfully!',
);

if (result.success) {
  // Handle success, e.g., update UI with result.data
} else {
  // Handle error, e.g., display result.errorMessage
}
```

### Dependencies

- `AppNotificationOverlay`: Used to show success and error notifications.
- `ElbException`, `HiddenException`, and `UnhandledException`: Custom exception classes.

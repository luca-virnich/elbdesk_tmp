# Steps to add a new Floating Window Type

For showing content in a Floating Window, we have to do some stuff and implementations

## Add a new Type to the FloatingWindowType Enum

At first, add the new type of the Window (e.g. companyEmployee) to the FLoatingWindowType Enum `elbrp_core/lib/src/features/floating_window/config/floating_window_type.dart`

## Create Floating Window Data Object

Each Floating-Window Type is represented by its FloatingWindowData. We need this to render the Window inside the Stack Window Wrapper in a performant way.

**Example**


```dart
/// The Class must be annotated as @immutable and extending the
/// FloatingWindowData
@immutable
/// Choose the Name correpsondeing to the Card it will redner, e.g. 
/// [CompanyEmmployee] for [CoompanyEmployeeCard]
class FloatingCompanyEmployeeWindowData extends FloatingWindowData {
  /// You can defines as many properties as needed, also here is the place to 
  /// define the taskbarIcon which is shown in the bottom Tasbar of the 
  /// Application
  FloatingCompanyEmployeeWindowData({
    required this.entityId,
  }) : super(
          /// Select the previously created enum here
          type: FloatingWindowType.companyEmployee,
          floatingWindowId: const Uuid().v4(),

          createdAt: DateTime.now(),
          /// Icon for the Taskbar
          taskbarIcon: AppIcons.person,
        );

  /// This is not used anywhere at the moment
  @override
  void onClose() {}

  /// This is not used anywhere at the moment
  @override
  void onSave() {}

  /// Take care to add all parameters and the correct WindowType here
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FloatingCompanyEmployeeWindowData &&
        other.entityId == entityId &&
        other.type == type &&
        other.floatingWindowId == floatingWindowId &&
        other.createdAt == createdAt &&
        other.taskbarIcon == taskbarIcon;
  }

  /// Take care to add all parameters here
  @override
  int get hashCode => Object.hash(
        entityId,
        type,
        floatingWindowId,
        createdAt,
        taskbarIcon,
      );

  /// The defined parameters for the class
  final int entityId;
}

```

### Create the Floating Window 

Create the Floatig Window as shown here:

```dart
class FloatingCompanyEmployeeCard extends StatelessWidget {
  
  const FloatingCompanyEmployeeCard({
    required this.data,
    super.key,
  });

  /// The previously defined data Object
  final FloatingCompanyEmployeeWindowData data;

  @override
  Widget build(BuildContext context) {
    return FloatingWindow(
      key: Key('floating-${data.floatingWindowId}'),
      initialPosition: FloatingWindowPosition.center,
      minimumWidth: 700,
      preferredInitialHeight: 900,
      preferredInitialWidth: 1000,
      windowId: data.floatingWindowId,
      /// The Widget which should be shown in the Floating Window
      child: CompanyEmployeeCard(
        floatingWindowId: data.floatingWindowId,
        companyEmployeeId: data.companyEmployeeId,
      ),
    );
  }
}
```



### Add the Window Type to the StackedFloatingWindow Widget

To be able to render a Widget with the previous created Data object, add it to the `StackedFloatingWindow` Widget in `elbrp/lib/features/dashboard/screens/dashboard_screen.dart`

```dart
 FloatingWindowType.companyEmployee => FloatingCompanyEmployeeCard(
          key: Key(data.floatingWindowId),
          data: data as FloatingCompanyEmployeeWindowData,
        ),

```

Now you can "open" the window with the following Method:

```dart
ref.read(floatingWindowDataStateProvider.notifier).addWindow(
    FloatingCompanyEmployeeWindowData(
        entityId: 1,
    )
)







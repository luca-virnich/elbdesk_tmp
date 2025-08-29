---
sidebar_position: 1
description: "Theme system implementation in app"
---

# Implementation

- The theming system provides a flexible and consistent way to style the application with support for multiple themes.
- The Theme can be changed at runtime by the user.
- We are able to access colors and other properties inside a widget without having to pass the theme down through the widget tree.

The result will look like this:
```dart
Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final statusColors = context.appTheme.statusColors;

    return Container(
      color: hovered 
      ? statusColors.warning 
      : generalColors.primary,
    );
}
```


## Folder Structure
The theming system is implemented in the `elbdesk_ui` package inside the `themes` folder.

You will find the following folders:
```dart
themes/
├── app_<theme_name>_theme/
├── colors/
├── components/
├── extensions/
└── _themes.dart
```
- `app_<theme_name>_theme`: For each theme we have a separate folder that will hold the properties for that specific theme.
- `colors`: Contains the `app_color_palette.dart` file. This file is at the moment the only file that holds all the colors used in the application.
- `components`: Contains the different compontents / classes that will bring a better abstraction and separation of concerns.
- `extensions`: Contains the extensions on `BuildContext` and `ThemeData`. We will cover these later in this document.
- `_themes.dart`: This file holds the necessary exports.



## Components
The goal is to have a good separation of concerns for different style components.
We want to have the status colors in one class, the general colors in another class, etc.

Each component is stored inside a new file in the `components` folder and is named like `app_<component_name>.dart`. The component is stored as a class and and can hold different properties but most commonly it will hold Colors. 
```dart
class AppGeneralColors {
  const AppGeneralColors({
    required this.primary,
    required this.onPrimary,
    required this.borderRadiusS,
    // ...
  });
  final Color primary;
  final Color onPrimary;
  final double borderRadiusS;
  // add more properties...
}
```

Each class/component will later be available via the `context.appTheme.<componentName>` syntax.



## Theming the components
As we have a seperate folder for each Theme, we will have a seperate file for each component in each theme folder.

```dart
components/
├── app_general_colors.dart
├── app_status_colors.dart
└── //add_more_components.dart
```

```dart
app_dark_theme/
├── app_dark_general_colors.dart
├── app_dark_status_colors.dart
├── //add_more_components.dart
└── app_dark_theme.dart // this file will be covered later
```

Inside each theme component file we will create a new final variable that will hold the properties for that specific theme. As an example we will use the `AppGeneralColors` component inside the `app_dark_general_colors.dart` file.

```dart
final appDarkGeneralColors = AppGeneralColors(
  primary: AppColorPalette.blue600,
  onPrimary: AppColorPalette.white,
  borderRadiusS: 10,
  // add more properties...
);
```
We need a final variable with every property for each component for every theme.



## Creating the ThemeData
As mentioned before we have a `app_<theme_name>_theme.dart` file in each theme folder.
Inside this file we will create a new `ThemeData` variable that will hold the theme data for that specific theme.
The important part is that we are using the `extensions` property to add the `AppThemeExtension` to the `ThemeData` with the corresponding final variables from the themed components we created before.

```dart
final appDarkTheme = ThemeData(
  extensions: [
    AppThemeExtension( // this will be covered later
        generalColors: appDarkGeneralColors, 
        buttonStyles: appDarkButtonStyles, 
        // add more components...
    ),
  ],
);
```

We now have a `ThemeData` variable that will hold the theme data with the corresponding components and properties for that specific theme.



## Extensions
In order to make the theme data accessible from the `BuildContext` we are using two extensions.

### Build Context Extension
The `BuildContext` is extended to access the theme data:

```dart 
extension BuildContextExtension on BuildContext {
  AppThemeExtension get appTheme {
    return Theme.of(this).extension<AppThemeExtension>()!;
  }
}
```

### Theme Data Extension
The `ThemeData` is extended with a custom theme extension to manage the theme configuration:

```dart
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.generalColors,
    required this.statusColors,
    // add more components...
  });
  final AppGeneralColors generalColors;
  final AppStatusColors statusColors;
  // add more components...

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    AppGeneralColors? generalColors,
    AppStatusColors? statusColors,
    // add more components...
  }) {
    return AppThemeExtension(
      generalColors: generalColors ?? this.generalColors,
      statusColors: statusColors ?? this.statusColors,
      // add more components...
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return this;
  }
}
```



## Theme Definition in Database
A Theme is defined as an enum in the database schema inside the `app_theme.spy.yaml` file:

```yaml
enum: AppTheme
serialized: byName

values:
  - system
  - light
  - dark
  - ...
```
When adding a new theme, it is important to add it with the corresponding name to the `values` section.



## Using the ThemeData

Inside the `_themes.dart` file we will export the `ThemeData` variables for each theme.
Then inside the `main.dart` file we will use the created ThemeData variable to assign it in the switch statement to the corresponding AppTheme enum value we created in the database schema.

```dart
theme: switch (theme) {
    AppTheme.dark => appDarkTheme,
    AppTheme.light => appLightTheme,
    AppTheme.system => getAppSystemTheme(context),
},
```
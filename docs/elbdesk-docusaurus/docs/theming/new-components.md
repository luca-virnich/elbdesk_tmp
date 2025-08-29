---
sidebar_position: 2
description: "Adding new components to the theme"
---

# New components

- A new component should be created when a new major widget is created or a new layer of abstraction is wanted.
- For this example we will create a new component for a imaginary Footer Widget of the App.
- We will only create and edit files inside the `themes` folder of the `elbdesk_ui` package.


## Create the Component
The first step is to create a new class that will hold the colors and / or other properties for the component.
The file is stored in the `components` folder and is named like `app_<component_name>.dart`.

```dart title="components/app_footer_properties.dart"
class AppFooterProperties {
  const AppFooterProperties({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.height,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final double height;
}
```
For this example we will only need these three properties, but you can add as many properties as you need.
A worthy consideration would be to also store the textstyle or hoverColor in this class, but for this example we keep it simple.



## Add the Component to the ThemeExtension

Inside the `AppThemeExtension` we need to add the new component to the required list of parameters.

```dart title="extensions/app_theme_extension.dart"
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.generalColors,
    required this.statusColors,
    required this.footerProperties, // Add the new component
  });
  final AppButtonStyles buttonStyles;
  final AppGeneralColors generalColors;
  final AppFooterProperties footerProperties; // Add the new component
  @override
  ThemeExtension<AppThemeExtension> copyWith({
    AppGeneralColors? generalColors,
    AppStatusColors? statusColors,
    AppFooterProperties? footerProperties, // Add the new component
  }) {
    return AppThemeExtension(
      generalColors: generalColors ?? this.generalColors,
      statusColors: statusColors ?? this.statusColors,
      footerProperties: footerProperties ?? this.footerProperties, // Add the new component
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


## Theming the Component

The previous step will give us a missing required parameter error in every `app_<theme_name>_theme.dart` file. To solve this error we first need to theme the component for each theme.

Inside each `app_<theme_name>_theme` folder we need to create a new file called `app_<theme_name>_<component_name>.dart`. Inside this file we will create a new final instance of the new component class and store the style it accordingly to the theme.


```dart title="app_light_theme/app_light_footer_properties.dart"
final appLightFooterProperties = AppFooterProperties(
  foregroundColor: AppColorPalette.white,
  backgroundColor: AppColorPalette.blue600,
  height: 50,
);
```


## Assigning the component to the theme

The last step is to solve the missing required parameter error we created in the previous step.

To do so we will assign the newly created instance of the component to the `AppThemeExtension` instance.

```dart title="app_light_theme/app_light_theme.dart", highlight={6-12}
final appLightTheme = ThemeData(
  fontFamily: 'Lato',
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: const TextTheme().apply(fontFamily: 'Lato'),
  extensions: [
    AppThemeExtension(
      generalColors: appLightGeneralColors,
      statusColors: appLightStatusColors,
      footerProperties: appLightFooterProperties, // Add the new instance
    ),
  ],
);
```


## Using the new component

Now that we have assigned the component to the theme, we can use its properties in our app.

```dart
Widget build(BuildContext context) {
    final footerProperties = context.appTheme.footerProperties;

    return AppFooter(
      color: footerProperties.backgroundColor,
      textColor: footerProperties.foregroundColor,
      iconColor: footerProperties.foregroundColor,
      height: footerProperties.height,
    );
} 
```







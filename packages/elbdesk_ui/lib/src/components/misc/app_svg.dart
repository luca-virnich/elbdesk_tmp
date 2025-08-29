import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// The type of SVG source, either network or asset.
enum _SvgType {
  /// SVG loaded from a network URL.
  network,

  /// SVG loaded from a local asset.
  asset
}

/// A widget that displays an SVG image from a network URL or a local asset.
///
/// The [AppSvg] widget can be used to display SVG images. It supports loading
/// SVGs from both network URLs and local assets. The type of SVG source is
/// determined by the [_SvgType] enum.
///
/// {@tool snippet}
/// This example shows how to use [AppSvg] to display an SVG from a network URL:
///
/// ```dart
/// AppSvg.network(
///   url: 'https://example.com/image.svg',
///   width: 100,
///   height: 100,
/// )
/// ```
/// {@end-tool}
///
/// {@tool snippet}
/// This example shows how to use [AppSvg] to display an SVG from a local asset:
///
/// ```dart
/// AppSvg.asset(
///   path: 'assets/image.svg',
///   width: 100,
///   height: 100,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [SvgPicture], which is the underlying widget used to display the SVG.
class AppSvg extends StatelessWidget {
  /// Creates an [AppSvg] widget with the specified type, path, width, and
  /// height.
  ///
  /// This constructor is used internally by the [AppSvg.network] and
  /// [AppSvg.asset]
  /// named constructors.
  const AppSvg._({
    required this.type,
    required this.path,
    this.height,
    this.width,
    super.key,
  });

  /// Creates an [AppSvg] widget that loads an SVG from a network URL.
  ///
  /// The [url] parameter must not be null.
  const AppSvg.network({
    required String url,
    double? width,
    double? height,
    Key? key,
  }) : this._(
          key: key,
          width: width,
          height: height,
          path: url,
          type: _SvgType.network,
        );

  /// Creates an [AppSvg] widget that loads an SVG from a local asset.
  ///
  /// The [path] parameter must not be null.
  const AppSvg.asset({
    required String path,
    double? width,
    double? height,
    Key? key,
  }) : this._(
          key: key,
          path: path,
          width: width,
          height: height,
          type: _SvgType.asset,
        );

  /// The path to the SVG image.
  final String path;

  /// The type of SVG source, either network or asset.
  final _SvgType type;

  /// The width of the SVG image.
  final double? width;

  /// The height of the SVG image.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        maxHeight: height ?? double.infinity,
      ),
      child: switch (type) {
        _SvgType.asset => SvgPicture.asset(
            path,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        _SvgType.network => SvgPicture.network(
            path,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
      },
    );
  }
}

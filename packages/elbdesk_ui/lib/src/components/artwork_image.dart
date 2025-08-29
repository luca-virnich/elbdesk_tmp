import 'dart:io';

import 'package:flutter/material.dart';

class ArtworkImage extends StatelessWidget {
  const ArtworkImage({
    this.path,
    super.key,
  });
  final String? path;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 113, maxHeight: 113),
      child: SizedBox(
        width: 113,
        height: 113,
        child: Image.file(
          width: 113,
          height: 113,
          File(
            path ?? 'assets/icons/coe_logo_1024.png',
          ),
          fit: BoxFit.contain,
        ),
        // child: CachedNetworkImage(
        //   imageUrl:
        //       path ?? '/Users/t-kietzmann/development/coe_data/curryking.jpeg',
        //   imageBuilder: (context, imageProvider) => Image(
        //     image: imageProvider,
        //     fit: BoxFit.cover,
        //   ),
        //   placeholder: (context, url) => const Center(
        //     child: AppLoadingIndicator(),
        //   ),
        //   errorWidget: (context, url, error) =>
        //       const Icon(AppIcons.error_outline),
        // ),
      ),
    );
  }
}

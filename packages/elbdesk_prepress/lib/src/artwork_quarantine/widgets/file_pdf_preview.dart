import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:pdfx/pdfx.dart';

/// Simple PDF preview widget
class FilePdfPreview extends HookWidget {
  const FilePdfPreview({
    required this.filePath,
    super.key,
  });

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElbIcon(AppIcons.picture_as_pdf, size: AppIconSize.xxl),
        ],
      ),
    );

    // Create PDF controller
    // final controller = useMemoized(
    //   () => PdfController(
    //     document: PdfDocument.openFile(filePath),
    //   ),
    //   [filePath],
    // );

    // // Handle controller disposal
    // useEffect(
    //   () {
    //     return controller.dispose;
    //   },
    //   [controller],
    // );

    // // Show PDF preview
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(theme.borderRadiuses.xs),
    //   child: PdfView(
    //     controller: controller,
    //     renderer: (PdfPage page) => page.render(
    //       width: page.width * 0.5,
    //       height: page.height * 0.5,
    //       format: PdfPageImageFormat.jpeg,
    //       backgroundColor: '#FFFFFF',
    //       quality: 100,
    //     ),
    //     builders: PdfViewBuilders<DefaultBuilderOptions>(
    //       options: const DefaultBuilderOptions(),
    //       pageLoaderBuilder: (_) => const Center(
    //         child: AppLoadingIndicator(),
    //       ),
    //       documentLoaderBuilder: (_) => const Center(
    //         child: AppLoadingIndicator(),
    //       ),
    //     errorBuilder: (_, error) => Center(child: AppText(error.toString())),
    //     ),
    //   ),
    // );
  }
}

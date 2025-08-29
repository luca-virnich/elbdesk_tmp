import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/models/artwork_color_specification.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/table/artwork_quarantine_color_view_table.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class ArtworkQuarantineMissingColorsTable extends HookWidget {
  const ArtworkQuarantineMissingColorsTable({
    required this.artworkQuarantine,
    required this.componentIdentifier,
    this.showTitlebar = true,
    super.key,
  });
  final ArtworkQuarantine artworkQuarantine;
  final ComponentIdentifier componentIdentifier;
  final bool showTitlebar;

  @override
  Widget build(BuildContext context) {
    final missingColors = useMemoized(
      () {
        final foundColors = artworkQuarantine.artworkData.colors;
        final analysisColors =
            artworkQuarantine.analysisData?.colorSpecifications ?? [];
        if (analysisColors.isEmpty) return <ArtworkColor>[];

        final existingNames =
            foundColors.map((c) => c.colorName).whereType<String>().toSet();

        final added = <String>{};
        final result = <ArtworkColor>[];

        for (final spec in analysisColors) {
          final name = spec.name;
          if (name == null) continue;

          if (!existingNames.contains(name) && added.add(name)) {
            result.add(
              ArtworkColor(
                colorName: name,
                shortName: name,
                l: 0,
                a: 0,
                b: 0,
                color: _buildSpecColor(spec),
                colorPalette: null,
                colorType: null,
                colorSpecType: null,
                verarbeitungsEbene: null,
                printProcess: null,
                screenLineature: null,
                screenAngle: null,
                screenPointForm: null,
                runtimeId: '',
                boost: 0,
                customText: '',
                meta: DataMeta.initial(),
              ),
            );
          }
        }

        return result; // nur die NICHT in foundColors enthaltenen, als ArtworkColor
      },
      [
        artworkQuarantine.artworkData.colors,
        artworkQuarantine.analysisData?.colorSpecifications,
      ],
    );

    return ArtworkQuarantineColorViewTable(
      componentIdentifier: componentIdentifier,
      title: 'Nicht gefundene Farben'.hc,
      colors: missingColors,
    );
  }
}

Color _buildSpecColor(ArtworkColorSpecification spec) {
  final r = spec.r;
  final g = spec.g;
  final b = spec.b;

  if (r == null || g == null || b == null) {
    return const Color(0x00000000);
  }
  final convertedR = (r * 255).toInt();
  final convertedG = (g * 255).toInt();
  final convertedB = (b * 255).toInt();

  return Color.fromARGB(255, convertedR, convertedG, convertedB);
}

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/color_transformer/cmfs.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/color_transformer/illuminats.dart';
import 'package:project_core/project_core.dart';

/// CIE 1931 2° CMFs in 1 nm Schritten, 380–780.
/// Format: { nm: [ xBar, yBar, zBar ] }

/// Dein Reflexionsspektrum bei jeweils 380, 390, ..., 730 nm (36 Werte).
/// Wir speichern das als Map<int, double> (gleiche Logik: {nm: R}).
/// Zwischen 740 und 780 hast du keine Messwerte, wir nehmen dort R=0
/// oder extrapolieren minimal.
final Map<int, double> reflectance10nm = {
  380: 0.027,
  390: 0.027,
  400: 0.026,
  410: 0.025,
  420: 0.024,
  430: 0.023,
  440: 0.021,
  450: 0.021,
  460: 0.021,
  470: 0.022,
  480: 0.025,
  490: 0.036,
  500: 0.058,
  510: 0.067,
  520: 0.056,
  530: 0.047,
  540: 0.043,
  550: 0.037,
  560: 0.026,
  570: 0.020,
  580: 0.047,
  590: 0.197,
  600: 0.460,
  610: 0.668,
  620: 0.775,
  630: 0.823,
  640: 0.852,
  650: 0.868,
  660: 0.877,
  670: 0.874,
  680: 0.872,
  690: 0.878,
  700: 0.888,
  710: 0.897,
  720: 0.900,
  730: 0.910,
};

/// Interpoliert das obige 10 nm Spektrum auf 1 nm.
/// Gibt eine Map<int, double> für 380..780 in 1-nm-Schritten zurück.
Map<int, double> interpolateReflectance1nm(
  Map<int, double> spectrum10nm, {
  int startNm = 380,
  int endNm = 730,
}) {
  final result = <int, double>{};

  // Alle 10 nm-Schritte, sortiert
  final sortedKeys = spectrum10nm.keys.toList()..sort();
  for (var nm = startNm; nm <= endNm; nm += 10) {
    // Falls nm direkt gemessen:
    // print('nm: $nm');
    if (spectrum10nm.containsKey(nm)) {
      result[nm] = spectrum10nm[nm]!;
      continue;
    }
    // Ansonsten Interpolation:
    // Finde benachbarte 10-nm-Anker
    // print('ankter calkd');
    var lowerKey = sortedKeys.first;
    var upperKey = sortedKeys.last;
    for (var i = 0; i < sortedKeys.length - 1; i++) {
      if (nm >= sortedKeys[i] && nm <= sortedKeys[i + 1]) {
        lowerKey = sortedKeys[i];
        upperKey = sortedKeys[i + 1];
        break;
      }
    }
    if (lowerKey == upperKey) {
      // Außerhalb 730..?
      // Dann null oder das Letzte, hier 730
      result[nm] = spectrum10nm[lowerKey]!;
    } else {
      final rLower = spectrum10nm[lowerKey]!;
      final rUpper = spectrum10nm[upperKey]!;
      final frac = (nm - lowerKey) / (upperKey - lowerKey);
      final r = rLower + frac * (rUpper - rLower);
      result[nm] = r;
    }
  }
  return result;
}

/// Diese Funktion berechnet L*, a*, b*, C* und h* aus
/// - dem (1-nm-interpolierten) Reflexionsspektrum
/// - den 1-nm-D65-Daten
/// - den 1-nm-CIE-1931-2°-CMFs
///
/// Sie gibt [L*, a*, b*, C*, h*] zurück.
List<double> computeLabFromSpectrum1nm(Map<int, double> reflectance1nm) {
  // Summen für X, Y, Z:
  var xSum = 0.0;
  var ySum = 0.0;
  var zSum = 0.0;

  // Wir summieren über 380..780 in 1 nm Schritten
  for (var nm = 380; nm <= 780; nm += 10) {
    final r = reflectance1nm[nm] ?? 0.0;
    final iD65 = d50[nm] ?? 0.0;
    final cmf = cie19312DegreeStandardObserver[nm];
    if (cmf == null) continue;

    final xBar = cmf[0];
    final yBar = cmf[1];
    final zBar = cmf[2];

    xSum += r * iD65 * xBar;
    ySum += r * iD65 * yBar;
    zSum += r * iD65 * zBar;
  }

  // Delta Lambda = 1 nm
  const deltaLambda = 10;

  // Normierung: Y=100 bei R=1 (perfektem Reflektor)
  // => wir brauchen WhiteY = Summe(1 * iD65 * yBar)
  var whiteY = 0.0;
  for (var nm = 380; nm <= 780; nm += 10) {
    final iD65 = d50[nm] ?? 0.0;
    final yBar = cie19312DegreeStandardObserver[nm]?[1] ?? 0.0;
    whiteY += iD65 * yBar;
  }
  // k = 100 / (whiteY * deltaLambda)
  final k = 100.0 / (whiteY * deltaLambda);

  final X = xSum * k * deltaLambda;
  final Y = ySum * k * deltaLambda;
  final Z = zSum * k * deltaLambda;

  // Weißpunkt D65 (2°) ~ (95.047, 100.000, 108.883)
  // const Xn = 95.047;
  // const Yn = 100;
  //const Zn = 108.883;

  // Weißpunkt D50 (2°) ~ (95.047, 100.000, 108.883)
  const xN = 96.422;
  const yN = 100;
  const zN = 82.521;

  // const Xn = 96.43;
  // const Yn = 100;
  // const Zn = 82.5;

  double f(double t) {
    const delta = 6.0 / 29.0;
    const delta3 = delta * delta * delta;
    if (t > delta3) {
      return math.pow(t, 1.0 / 3.0) as double;
    } else {
      // (29/6)^2 / 3 ~ 7.787
      return (7.787 * t) + (16.0 / 116.0);
    }
  }

  final fx = f(X / xN);
  final fy = f(Y / yN);
  final fz = f(Z / zN);

  final L = (116.0 * fy) - 16.0;
  final a = 500.0 * (fx - fy);
  final b = 200.0 * (fy - fz);

  final C = math.sqrt(a * a + b * b);
  var h = math.atan2(b, a) * 180.0 / math.pi;
  if (h < 0) {
    h += 360.0;
  }

  return [L, a, b, C, h];
}

List<double> calculateColor(List<double> reflectanceValues) {
  // 1) Interpolation des 10-nm-Spektrums auf 1 nm
  final finalData = <int, double>{
    380: reflectanceValues[0],
    390: reflectanceValues[1],
    400: reflectanceValues[2],
    410: reflectanceValues[3],
    420: reflectanceValues[4],
    430: reflectanceValues[5],
    440: reflectanceValues[6],
    450: reflectanceValues[7],
    460: reflectanceValues[8],
    470: reflectanceValues[9],
    480: reflectanceValues[10],
    490: reflectanceValues[11],
    500: reflectanceValues[12],
    510: reflectanceValues[13],
    520: reflectanceValues[14],
    530: reflectanceValues[15],
    540: reflectanceValues[16],
    550: reflectanceValues[17],
    560: reflectanceValues[18],
    570: reflectanceValues[19],
    580: reflectanceValues[20],
    590: reflectanceValues[21],
    600: reflectanceValues[22],
    610: reflectanceValues[23],
    620: reflectanceValues[24],
    630: reflectanceValues[25],
    640: reflectanceValues[26],
    650: reflectanceValues[27],
    660: reflectanceValues[28],
    670: reflectanceValues[29],
    680: reflectanceValues[30],
    690: reflectanceValues[31],
    700: reflectanceValues[32],
    710: reflectanceValues[33],
    720: reflectanceValues[34],
    730: reflectanceValues[35],
  };
  final refl1nm = interpolateReflectance1nm(finalData);

  // 2) Berechnung von Lab, C, h
  final result = computeLabFromSpectrum1nm(refl1nm);
  // final L = result[0];
  // final a = result[1];
  // final b = result[2];
  // final C = result[3];
  // final h = result[4];

  // // Ausgabe
  // print('Berechnetes Ergebnis (1 nm, D65, 2° CMF)');
  // print('L* = ${L.toStringAsFixed(2)}');
  // print('a* = ${a.toStringAsFixed(2)}');
  // print('b* = ${b.toStringAsFixed(2)}');
  // print('C* = ${C.toStringAsFixed(2)}');
  // print('h* = ${h.toStringAsFixed(2)}');
  // print('lab values complete: $result');
  return result;
}

/// Hinweis:
/// Die obige CMF-Tabelle ist der Länge halber gekürzt.
/// Für exakte Resultate musst du ALLE Werte (380–780) eintragen.
/// Die findest du hier:
///   https://github.com/colour-science/colour/blob/develop/colour/colorimetry/datasets/cmfs.py
///   -> "CIE_1931_2_degree_cmfs"
///
/// Ebenso ist die D65-Tabelle oben zwar vollständig,
/// aber beachte das "1.0368" bei 780 nm (kleine Abweichung in 'colour').
/// Manche Quellen haben dort 0.0.
/// Minimale Abweichungen sind daher möglich.
///
/// Wenn du ALLE Werte für xBar, yBar, zBar in 1 nm anstelle
/// des gekürzten Blocks verwendest,
/// solltest du nahe an L=74.09, a=-46.95, b=75.08 usw. liegen.

Future<void> manPDF() async {
  final currentPath = Directory.current.path;
  // print(currentPath);
  // return;
  // Pfad zur CSV-Datei
  final filePath = '$currentPath/PANTONE_Solid_Coated_Colors.csv';
  final input = File(filePath).openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(
        const CsvToListConverter(
          fieldDelimiter: ',',
          shouldParseNumbers: false,
          eol: '\n',
        ),
      )
      .toList();

  final headers = fields.first;
  final data = fields.sublist(1);
  // print(data.take(10).toList());
  // final first10 = data.take(10).toList();

  // final data = fields.sublist(1); // Alle anderen Zeilen
  // // print(data);
  // // Beispiel: Werte auslesen und bearbeiten
  for (final row in data) {
    final reflectanceValues = row
        .sublist(4)
        .map((e) => double.tryParse(e.toString()) ?? 0.0)
        .toList(); // Spektralwerte (je nach Struktur der Datei)

    // Hier können Sie Ihren Dart-Code zur La*b*-Berechnung einfügen
    final lab = calculateColor(reflectanceValues);
    dlog(lab);
    final colorName = row[0].toString();

    final l = lab[0];
    final a = lab[1];
    final b = lab[2];
    // final C = lab[3];
    // final h = lab[4];

    final toFlutterColor = labToColor(l, a, b);

    final artworkColor = ArtworkColorDTO(
      colorName: colorName,
      shortName: '',
      color: toFlutterColor.toRadixDbString,
      l: l,
      a: a,
      b: b,
      colorPaletteId: 3,
      createdAt: DateTime.now(),
      isDraft: false,
    );
    await serverpodClient.artworkColor.createFromCsv(
      artworkColor: artworkColor,
    );

    // row.addAll(lab); // L*, a*, b* hinzufügen
  }
  // return;

  // // Neuen Header hinzufügen
  headers.addAll(['L*', 'a*', 'b*', 'C*', 'h*']);

  // // Neue CSV-Datei speichern
  final newCsvFile =
      File('$currentPath/PANTONE_Solid_Coated_Colors_converted.csv');
  final output = [headers, ...data];
  final csvData = const ListToCsvConverter().convert(output);
  await newCsvFile.writeAsString(csvData);

  // print('Neue CSV-Datei wurde erstellt!');
}

// Platzhalter für Ihre La*b*-Berechnungsfunktion
// List<double> calculateLab(List<double> reflectanceValues) {
//   // Ihre Logik zur La*b*-Berechnung hier einfügen
//   return [50.0, 0.0, 0.0]; // Beispielwert
// }
Color labToColor(double labL, double labA, double labB) {
  // LAB → XYZ
  var y = (labL + 16) / 116;
  var x = labA / 500 + y;
  var z = y - labB / 200;

  x = (pow(x, 3) > 0.008856) ? pow(x, 3).toDouble() : (x - 16 / 116) / 7.787;
  y = (pow(y, 3) > 0.008856) ? pow(y, 3).toDouble() : (y - 16 / 116) / 7.787;
  z = (pow(z, 3) > 0.008856) ? pow(z, 3).toDouble() : (z - 16 / 116) / 7.787;

  x *= 95.047; // D65 reference white
  y *= 100.000;
  z *= 108.883;

  // XYZ → RGB
  var r = x * 0.032406 + y * -0.015372 + z * -0.004986;
  var g = x * -0.009689 + y * 0.018758 + z * 0.000415;
  var b = x * 0.000557 + y * -0.002040 + z * 0.010570;

  // Normalize RGB values
  r = (r > 0.0031308) ? (1.055 * pow(r, 1 / 2.4) - 0.055) : (12.92 * r);
  g = (g > 0.0031308) ? (1.055 * pow(g, 1 / 2.4) - 0.055) : (12.92 * g);
  b = (b > 0.0031308) ? (1.055 * pow(b, 1 / 2.4) - 0.055) : (12.92 * b);

  // Clamp values to [0, 1]
  r = r.clamp(0.0, 1.0);
  g = g.clamp(0.0, 1.0);
  b = b.clamp(0.0, 1.0);

  // Convert to 0–255 range
  final red = (r * 255).round();
  final green = (g * 255).round();
  final blue = (b * 255).round();

  // Return Flutter Color
  return Color.fromARGB(255, red, green, blue);
}

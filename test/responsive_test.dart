import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/app.dart';

void main() {
  const testWidths = [
    320.0,
    360.0,
    390.0,
    414.0,
    600.0,
    768.0,
    820.0,
    1024.0,
    1280.0,
    1366.0,
    1440.0,
    1920.0,
  ];

  for (final width in testWidths) {
    testWidgets(
      'Responsive test at ${width.toInt()}px width without overflow',
      (WidgetTester tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);

        await tester.pumpWidget(const PortfolioApp());
        await tester.pumpAndSettle();

        // Verify no assertion error or render flex overflow
        expect(tester.takeException(), isNull);
      },
    );
  }
}

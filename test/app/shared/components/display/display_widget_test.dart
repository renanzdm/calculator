import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_calculator/app/shared/components/display/display_widget.dart';

main() {
  testWidgets('DisplayWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DisplayWidget()));
    final textFinder = find.text('Display');
    expect(textFinder, findsOneWidget);
  });
}

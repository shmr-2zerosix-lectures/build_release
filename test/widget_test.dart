// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:build_release/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  group('animated container', () {
    final containerFinder = find.byKey(const ValueKey('first'));

    testWidgets('exist', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('changes color after tap', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      var decorationStart = tester
          .widget<AnimatedContainer>(containerFinder)
          .decoration as BoxDecoration;

      expect(decorationStart.color, Colors.red);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      final decorationEnd = tester
          .widget<AnimatedContainer>(containerFinder)
          .decoration as BoxDecoration;

      expect(decorationEnd.color, Colors.blue);
    });

    testWidgets('changes color with animation', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      await expectLater(
        containerFinder,
        matchesGoldenFile('MyApp.color.even.png'),
      );

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 250));
      await expectLater(
        containerFinder,
        matchesGoldenFile('MyApp.color.even-to-odd-250.png'),
      );

      await tester.pump(const Duration(milliseconds: 250));
      await expectLater(
        containerFinder,
        matchesGoldenFile('MyApp.color.even-to-odd-500.png'),
      );

      await tester.pump(const Duration(milliseconds: 250));
      await expectLater(
        containerFinder,
        matchesGoldenFile('MyApp.color.even-to-odd-750.png'),
      );

      await tester.pump(const Duration(milliseconds: 250));
      await expectLater(
        containerFinder,
        matchesGoldenFile('MyApp.color.odd.png'),
      );
    });
  });
}

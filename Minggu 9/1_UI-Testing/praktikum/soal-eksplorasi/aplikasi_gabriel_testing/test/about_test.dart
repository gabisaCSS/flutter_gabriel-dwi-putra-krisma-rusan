import 'package:aplikasi_gabriel/page/welcome_page/components/about_us_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Header Harus "About Us"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AboutUsComponent(),
    ));

    expect(find.text('About Us'), findsOneWidget);
  });

  testWidgets('Harus ada minimal 2 Card', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AboutUsComponent(),
    ));

    expect(find.byType(Card, skipOffstage: false), findsAtLeastNWidgets(2));
  });

  testWidgets('Harus ada Image', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AboutUsComponent(),
    ));

    expect(find.byType(Image, skipOffstage: false), findsAtLeastNWidgets(1));
  });
}

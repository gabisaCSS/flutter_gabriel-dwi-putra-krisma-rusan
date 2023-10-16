import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_gabriel/page/about_page/about_page.dart';

void main() {
  testWidgets('Judul Halaman Harus "ABOUT US"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AboutPage(),
    ));

    expect(find.text('ABOUT US'), findsOneWidget);
  });

  testWidgets('Halaman Harus ada kata kata minimal 5',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AboutPage(),
    ));

    expect(find.byType(Text), findsAtLeastNWidgets(3));
  });
}

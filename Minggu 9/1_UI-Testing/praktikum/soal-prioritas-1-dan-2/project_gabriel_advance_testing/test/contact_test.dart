import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_gabriel/page/contact_page/contact_page.dart';
import 'package:project_gabriel/page/contact_page/widget/header_contact_page.dart';
import 'package:project_gabriel/widget/elevated_button_widget.dart';
import 'package:project_gabriel/widget/text_field_widget.dart';

void main() {
  testWidgets('Judul Halaman Harus "CONTACT"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(find.text('CONTACT'), findsOneWidget);
  });

  testWidgets('Header Harus ada "Create New Contacts" dan ada icon hp',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HeaderContactPage()));

    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.byIcon(Icons.phone_android_outlined), findsOneWidget);
  });

  testWidgets('Contact Page harus ada name dan nomor field',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(
        find.byWidgetPredicate(
          (widget) => widget is TextFieldWidget && widget.label == 'Name',
        ),
        findsOneWidget);

    expect(
        find.byWidgetPredicate(
          (widget) => widget is TextFieldWidget && widget.label == 'Nomor',
        ),
        findsOneWidget);
  });

  testWidgets('Halaman harus ada date picker"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(find.text('Select', skipOffstage: false), findsOneWidget);
  });

  testWidgets('Halaman harus ada color picker"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(
        find.byWidgetPredicate(
            (widget) =>
                widget is ElevatedButtonWidget && widget.text == 'Pick Color',
            skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Halaman harus ada file picker"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(
        find.byWidgetPredicate(
            (widget) =>
                widget is ElevatedButtonWidget && widget.text == 'Pick File',
            skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Contact Page harus ada button Submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(
        find.byWidgetPredicate(
            (widget) =>
                widget is ElevatedButtonWidget && widget.text == 'Submit',
            skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Contact Page harus ada button Submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    expect(
        find.byWidgetPredicate(
            (widget) =>
                widget is ElevatedButtonWidget && widget.text == 'Submit',
            skipOffstage: false),
        findsOneWidget);
  });
}

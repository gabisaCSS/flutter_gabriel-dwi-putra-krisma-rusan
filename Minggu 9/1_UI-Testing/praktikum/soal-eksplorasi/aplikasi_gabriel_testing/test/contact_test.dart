import 'package:aplikasi_gabriel/page/welcome_page/components/contact_us_component.dart';
import 'package:aplikasi_gabriel/widget/elevated_button_widget.dart';
import 'package:aplikasi_gabriel/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_gabriel/providers/email_field_change_notifier/email_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/message_field_change_notifier/message_field_change_notifier.dart';
import 'package:aplikasi_gabriel/providers/name_field_change_notifier/name_field_change_notifier.dart';

void main() {
  testWidgets('Header Harus "Contact Us"', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => EmailFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => MessageFieldChangeNotifier()),
      ],
      child: MaterialApp(
        home: ContactUsComponent(),
      ),
    ));

    expect(find.text('Contact Us'), findsOneWidget);
  });
  testWidgets('Component Harus ada 3 text field, nama, email, message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => EmailFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => MessageFieldChangeNotifier()),
      ],
      child: MaterialApp(
        home: ContactUsComponent(),
      ),
    ));

    expect(find.byType(TextFieldWidget), findsNWidgets(3));
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Name'),
        findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Email'),
        findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextFieldWidget && widget.label == 'Message'),
        findsOneWidget);
  });
  testWidgets('Component Harus ada submit button', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => EmailFieldChangeNotifier()),
        ChangeNotifierProvider(create: (_) => MessageFieldChangeNotifier()),
      ],
      child: MaterialApp(
        home: ContactUsComponent(),
      ),
    ));

    expect(
        find.byWidgetPredicate((widget) =>
            widget is ElevatedButtonWidget && widget.text == 'Submit'),
        findsOneWidget);
  });
}

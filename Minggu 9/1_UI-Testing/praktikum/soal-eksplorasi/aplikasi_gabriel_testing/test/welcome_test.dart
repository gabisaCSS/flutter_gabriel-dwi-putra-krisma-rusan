import 'package:aplikasi_gabriel/page/welcome_page/components/welcome_component.dart';
import 'package:aplikasi_gabriel/providers/scroll_controller_change_notifier.dart';
import 'package:aplikasi_gabriel/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Harus ada "Welcome"', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollControllerChangeNotifier()),
      ],
      child: MaterialApp(
        home: WelcomeComponent(),
      ),
    ));

    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('Harus ada "Gabriel Food"', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollControllerChangeNotifier()),
      ],
      child: MaterialApp(
        home: WelcomeComponent(),
      ),
    ));

    expect(find.text('Welcome'), findsOneWidget);
  });
  testWidgets('Harus ada Image', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollControllerChangeNotifier()),
      ],
      child: MaterialApp(
        home: WelcomeComponent(),
      ),
    ));

    expect(find.byType(Image), findsAtLeastNWidgets(1));
  });

  testWidgets('Harus ada Button Get Started', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollControllerChangeNotifier()),
      ],
      child: MaterialApp(
        home: WelcomeComponent(),
      ),
    ));

    expect(
        find.byWidgetPredicate((widget) =>
            widget is ElevatedButtonWidget && widget.text == 'Get Started'),
        findsOneWidget);
  });
}

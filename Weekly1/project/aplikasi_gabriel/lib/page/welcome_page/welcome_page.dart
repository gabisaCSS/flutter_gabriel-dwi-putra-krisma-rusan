import 'package:aplikasi_gabriel/page/welcome_page/components/contact_us_component.dart';
import 'package:aplikasi_gabriel/page/welcome_page/components/welcome_component.dart';
import 'package:aplikasi_gabriel/providers/scroll_controller_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider =
        Provider.of<ScrollControllerChangeNotifier>(context);

    return Scaffold(
        body: ListView(
      controller: scrollControllerProvider.controller,
      children: const [WelcomeComponent(), ContactUsComponent()],
    ));
  }
}

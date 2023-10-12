import 'package:aplikasi_gabriel/constants/assets.dart';
import 'package:aplikasi_gabriel/page/welcome_page/components/about_us_component.dart';
import 'package:aplikasi_gabriel/page/welcome_page/components/contact_us_component.dart';
import 'package:aplikasi_gabriel/page/welcome_page/components/drawer_component.dart';
import 'package:aplikasi_gabriel/page/welcome_page/components/welcome_component.dart';
import 'package:aplikasi_gabriel/providers/scroll_controller_change_notifier.dart';
import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider =
        Provider.of<ScrollControllerChangeNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Gabriel Food',
            style: TextStyleWidget.appBarTitle(),
          ),
          leading: Image.asset(
            Assets.assetsG12,
            scale: 2,
          ),
          surfaceTintColor: Colors.transparent,
        ),
        endDrawer: const DrawerComponent(),
        backgroundColor: Colors.white,
        body: ListView(
          controller: scrollControllerProvider.controller,
          children: const [
            WelcomeComponent(),
            ContactUsComponent(),
            AboutUsComponent()
          ],
        ));
  }
}

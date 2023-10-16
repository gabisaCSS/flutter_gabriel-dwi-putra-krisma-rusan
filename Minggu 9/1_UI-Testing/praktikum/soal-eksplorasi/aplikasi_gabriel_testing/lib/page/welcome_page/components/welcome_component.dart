import 'package:aplikasi_gabriel/constants/assets.dart';
import 'package:aplikasi_gabriel/providers/scroll_controller_change_notifier.dart';
import 'package:aplikasi_gabriel/widget/elevated_button_widget.dart';
import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider =
        Provider.of<ScrollControllerChangeNotifier>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  // color: Colors.red,
                  child: Image.asset(Assets.assetsG12),
                ),
                Text(
                  'Gabriel Food',
                  style: TextStyleWidget.header1(),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 80, left: 80, bottom: 51),
            child: SizedBox(
              width: 214,
              height: 243,
              child: Image.asset(Assets.assetsIllustration),
            ),
          ),
          Column(children: [
            Text(
              'Welcome',
              style: TextStyleWidget.header2(),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "It's a pleasure to meet you. We are excited that you're here so let's get started!",
                style: TextStyleWidget.body(),
                textAlign: TextAlign.center,
              ),
            )
          ]),
          const SizedBox(
            height: 50,
          ),
          ElevatedButtonWidget(
              text: 'Get Started',
              onPressed: () {
                scrollControllerProvider.scrollToEnd();
              }),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

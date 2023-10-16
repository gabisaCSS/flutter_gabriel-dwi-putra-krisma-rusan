import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Contact Us',
                style: TextStyleWidget.body(color: const Color(0xFFEEA734)),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'About Us',
                style: TextStyleWidget.body(color: const Color(0xFFEEA734)),
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: TextStyleWidget.body(color: const Color(0xFFEEA734)),
            ),
          ),
        ],
      ),
    );
  }
}

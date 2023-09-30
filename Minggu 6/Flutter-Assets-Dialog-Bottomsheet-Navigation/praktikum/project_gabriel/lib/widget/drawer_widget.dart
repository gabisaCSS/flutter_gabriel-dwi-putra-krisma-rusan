import 'package:flutter/material.dart';
import 'package:project_gabriel/navigation/navigation.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.contactPage);
              },
              child: Text(
                'Contact',
                style: TextStyleTheme()
                    .m3BodyLarge(color: LightTheme().m3SysLightPrimary),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.galleryPage);
              },
              child: Text(
                'Gallery',
                style: TextStyleTheme()
                    .m3BodyLarge(color: LightTheme().m3SysLightPrimary),
              )),
        ]),
      ),
    );
  }
}

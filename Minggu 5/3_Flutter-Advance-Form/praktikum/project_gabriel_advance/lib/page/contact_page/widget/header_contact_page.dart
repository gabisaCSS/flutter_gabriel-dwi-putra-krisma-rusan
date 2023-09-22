import 'package:flutter/material.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/jarak_widget.dart';

class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(border: Border.all()),
        margin: const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 16),
        // padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: Column(
          children: [
            const JarakVertikal(24),
            const Icon(Icons.phone_android_outlined),
            const JarakVertikal(16),
            Text(
              'Create New Contacts',
              style: TextStyleTheme()
                  .m3HeadlineSmall(color: LightTheme().m3SysLightOnSurface),
            ),
            const JarakVertikal(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                style: TextStyleTheme().m3BodyMedium(
                    color: LightTheme().m3SysLightOnSurfaceVariant),
              ),
            ),
            const JarakVertikal(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: LightTheme().m3SysLightOutlineVariant,
              ),
            )
          ],
        ));
  }
}

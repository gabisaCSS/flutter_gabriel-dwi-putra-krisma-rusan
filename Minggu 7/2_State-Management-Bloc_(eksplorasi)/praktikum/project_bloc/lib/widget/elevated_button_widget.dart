import 'package:flutter/material.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ElevatedButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          textStyle: TextStyleTheme()
              .m3LabelLarge(color: LightTheme().m3SysLightOnPrimary),
          backgroundColor: LightTheme().m3SysLightPrimary),
      child: Text(
        text,
        style: TextStyleTheme()
            .m3LabelLarge(color: LightTheme().m3SysLightOnPrimary),
      ),
    );
  }
}

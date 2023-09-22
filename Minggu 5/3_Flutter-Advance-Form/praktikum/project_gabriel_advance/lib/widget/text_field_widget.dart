import 'package:flutter/material.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.errorText,
    this.keyboardType,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
            label: Text(label),
            labelStyle: TextStyleTheme()
                .m3BodySmall(color: LightTheme().m3SysLightOnSurfaceVariant),
            hintStyle: TextStyleTheme()
                .m3BodyLarge(color: LightTheme().m3SysLightOnSurfaceVariant),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            errorText: errorText,
            filled: true,
            fillColor: LightTheme().m3SysLightSurfaceVariant),
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}

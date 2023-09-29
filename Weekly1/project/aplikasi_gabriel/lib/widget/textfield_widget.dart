import 'package:aplikasi_gabriel/widget/text_style_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? errorText;
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.onChanged,
      this.maxLines,
      this.keyboardType = TextInputType.text,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyleWidget.label(),
          ),
          hintText: hintText,
          errorText: errorText,
          filled: true,
          fillColor: const Color(0xFF868686).withOpacity(0.2),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF868686)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF868686)),
          ),
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}

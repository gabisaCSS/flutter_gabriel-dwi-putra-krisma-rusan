import 'package:flutter/material.dart';

class ContactModel {
  String name, phone, fileName;
  DateTime date;
  Color pickedColor;
  ContactModel(
      {required this.name,
      required this.phone,
      required this.date,
      required this.fileName,
      required this.pickedColor});
}

// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(
    json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
  int? id;
  String name;
  String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}

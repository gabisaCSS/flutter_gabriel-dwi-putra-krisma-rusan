import 'package:dio/dio.dart';
import 'package:project_gabriel/model/contact/contact_model.dart';

class ContactApi {
  static Future<List<ContactModel>> getContact() async {
    List<ContactModel> listContactModel = [];

    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/');

    List<dynamic> rawContactData = response.data;

    listContactModel =
        rawContactData.map((e) => ContactModel.fromJson(e)).toList();

    return listContactModel;
  }

  static Future<ContactModel> postContact(
      {required ContactModel contactModel}) async {
    final response = await Dio().post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
        data: contactModel.toJson());

    ContactModel newContactModel = ContactModel.fromJson(response.data);

    return newContactModel;
  }
}

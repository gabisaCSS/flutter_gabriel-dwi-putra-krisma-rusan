import 'package:dio/dio.dart';

class DicebearApi {
  static Future<String> getDicebear(
      {required String imageStyle, required String seed}) async {
    final response = await Dio()
        .get('https://api.dicebear.com/7.x/$imageStyle/svg?seed=$seed');
    String imageResponse = response.data as String;

    return imageResponse;
  }
}

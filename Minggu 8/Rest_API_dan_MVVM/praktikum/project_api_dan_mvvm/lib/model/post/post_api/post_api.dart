import 'package:dio/dio.dart';
import 'package:project_gabriel/model/post/post_model.dart';

class PostApi {
  static Future<PostModel> putPost(
      {required int id,
      int? userId,
      required String title,
      required String body}) async {
    final response = await Dio().put(
        'https://jsonplaceholder.typicode.com/posts/$id',
        data: {"userId": userId, "title": title, "body": body});

    PostModel updatedPostModel = PostModel.fromJson(response.data);

    return updatedPostModel;
  }
}

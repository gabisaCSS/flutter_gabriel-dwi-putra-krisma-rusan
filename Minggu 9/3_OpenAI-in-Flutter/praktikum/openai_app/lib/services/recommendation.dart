import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:openai_app/constants/open_ai.dart';
import 'package:openai_app/models/openAi_model/openai_model.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<OpenAiModel> getRecommendation(
      {required String budget,
      required String camera,
      required String internalStorage}) async {
    late OpenAiModel openaiModel = OpenAiModel(
        id: "",
        object: "",
        created: 0,
        model: "",
        choices: [],
        usage: Usage(
          completionTokens: 0,
          promptTokens: 0,
          totalTokens: 0,
        ));

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
          locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);

      String smartphoneBudget = formatCurrency.format(int.parse(budget));

      String promptData =
          "You are a smartphone expert. Give me a smartphone recommendations with budget equals $smartphoneBudget with camera $camera mega pixel and internal storage $internalStorage";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      final response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        openaiModel = openAiModelFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error accured when sending request');
    }

    return openaiModel;
  }
}

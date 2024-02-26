import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAiClient {
  Future<Map<String, dynamic>> requestOpenAI({
    required String prompt,
    String? base64Image,
    double? latitude,
    double? longitude,
  }) async {
    await dotenv.load();
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null) {
      print('Error: OpenAI API key not found in environment variables');
      return {};
    }

    final uri = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    String model = 'gpt-4-vision-preview';
    if (base64Image == null) {
      model = 'gpt-4-turbo-preview';
    }

    Map<String, dynamic> payload = {
      "model": model,
      "messages": [
        {
          "role": "user",
          "content": [
            {"type": "text", "text": prompt},
            if (base64Image != null) {"type": "image", "data": base64Image},
          ],
        },
      ],
      "max_tokens": 300,
    };

    try {
      final response =
          await http.post(uri, headers: headers, body: json.encode(payload));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        print('Failed to analyze image: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      print('An error occured: $e');
      return {};
    }
  }
}

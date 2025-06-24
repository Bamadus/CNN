import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cnn/features/domain/models/news.dart';
// import 'package:cnn/features/data/services/api_token.dart';

Future<List<News>> fetchNews() async {
  final String apiKey = 'crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg';
  final url = 'https://finnhub.io/api/v1/news?category=general&token=$apiKey';
  final response = await http.get(Uri.parse(url));

  print('STATUS CODE: ${response.statusCode}');
  print('RESPONSE: ${response.body}');

  if (response.statusCode == 200) {
    final List<dynamic> data = await json.decode(response.body);
    return data.map((json) => News.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load news');

  }
}
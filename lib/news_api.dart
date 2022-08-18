import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2022-08-17&to=2022-08-17&sortBy=popularity&apiKey=870037a8a384410e9203c82901c4b3b4'
  );

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List articalsList = map['articles'];

    List<NewsApiModel> newsList =
    articalsList.map((jsonData) => NewsApiModel.fromJson(jsonData)).toList();

    print(articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}
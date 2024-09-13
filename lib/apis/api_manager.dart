import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourceResponse.dart';
import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/NewsData.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=901eb63076fb4775b57dac3d0a419e59

  static Future<SourceResponse> getScources(String id) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "901eb63076fb4775b57dac3d0a419e59", "category": id});
    http.get(url);

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);

    return sourceResponse;
  }

  static Future<NewsDataResponse> getNewsData(
      {String? sourceId, String? query}) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "901eb63076fb4775b57dac3d0a419e59",
      "sources": sourceId,
      "q": query
    });

    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);

    return newsDataResponse;
  }
}

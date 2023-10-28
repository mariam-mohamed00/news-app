import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news/api_constants.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    /// https://newsapi.org/v2/top-headlines/sources?apiKey=160b37cde254481a8ed739c8867411d1

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {"apiKey": "160b37cde254481a8ed739c8867411d1", "category": categoryId});

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String? sourceId) async {
    /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=160b37cde254481a8ed739c8867411d1

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {
          "apiKey": "160b37cde254481a8ed739c8867411d1",
          "sources": sourceId,
          // "q" : query
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> searchNews(String query) async {
    /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=160b37cde254481a8ed739c8867411d1

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {
          "apiKey": "160b37cde254481a8ed739c8867411d1",
          "q" : query
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}

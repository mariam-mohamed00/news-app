import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import '../model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;

  void getNewsBtSourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }


  void searchNews(String query) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var searchNews = await ApiManager.searchNews(query);
      if (searchNews.status == 'error') {
        errorMessage = searchNews.message;
      } else {
        newsList = searchNews.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/model/interested_topic.dart';
import 'package:landlord/data/network/repository/repository.dart';

class SavedArticleProvider extends ChangeNotifier {
  NewsResponse? savedArticle;

  SavedArticleProvider(BuildContext context) {
    savedArticleData(context);
  }

  void savedArticleData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getSavedArticleData();
    if (apiResponse != null) {
      savedArticle = apiResponse;
    }
    notifyListeners();
  }
}

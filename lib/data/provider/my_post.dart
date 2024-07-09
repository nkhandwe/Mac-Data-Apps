import 'package:flutter/material.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class MyPostProvider extends ChangeNotifier {
  NewsResponse? myPostResponsesData;

  MyPostProvider(BuildContext context) {
    myPostData(context);
  }

  void myPostData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getMyPostData();
    if (apiResponse != null) {
      myPostResponsesData = apiResponse;
    }
    notifyListeners();
  }
}

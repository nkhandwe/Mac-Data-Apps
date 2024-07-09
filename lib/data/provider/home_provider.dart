import 'package:flutter/cupertino.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/model/category_model.dart';
import 'package:landlord/data/model/news_category_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class HomeProvider extends ChangeNotifier {
  NewsResponse? newsResponseData;
  NewsResponse? breakingScrollingData;
  NewsResponse? serialOneToFiveData;
  NewsResponse? serialSixToEightData;
  NewsResponse? serialNineToTwelveData;
  NewsResponse? serialThirteenToFifteenData;
  NewsResponse? serialSixteenToTwentyData;
  NewsResponse? serialTwentyOneToTwentyThreeData;
  NewsResponse? currentNewsData;
  NewsResponse? trendingNewsData;
  CategoryModel? categoryData;
  NewsCategoryModel? newsCategoryData;

  HomeProvider(BuildContext context) {
    getBreakingNewsSliderData(context);
    getBreakingScrollingData(context);
    getSerialOneToFiveData(context);
    getCurrentNewsData(context);
    getTrendingNewsData(context);
    getCategoryData(context);
    getSerialSixToEightNewsData(context);
    getSerialNineToTwelveNewsData(context);
    getSerialThirteenToFifteenNewsData(context);
    getSerialSixteenToTwentyNewsData(context);
    getSerialTwentyOneTwentyThreeNewsData(context);
    getNewsCategoryData(context);
  }

  void getBreakingNewsSliderData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getBreakingNewsSliderData();
    if (apiResponse != null) {
      newsResponseData = apiResponse;
    }
    notifyListeners();
  }

  void getBreakingScrollingData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getBreakingScrollingNewsData();
    if (apiResponse != null) {
      breakingScrollingData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialOneToFiveData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialOneToFiveNewsData();
    if (apiResponse != null) {
      serialOneToFiveData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialSixToEightNewsData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialSixToEightNewsData();
    if (apiResponse != null) {
      serialSixToEightData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialNineToTwelveNewsData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialNineToTwelveNewsData();
    if (apiResponse != null) {
      serialNineToTwelveData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialThirteenToFifteenNewsData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialThirteenToFifteenNewsData();
    if (apiResponse != null) {
      serialThirteenToFifteenData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialSixteenToTwentyNewsData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialSixteenToTwentyNewsData();
    if (apiResponse != null) {
      serialThirteenToFifteenData = apiResponse;
    }
    notifyListeners();
  }

  void getSerialTwentyOneTwentyThreeNewsData(BuildContext context) async {
    var apiResponse =
        await RepositoryImpl(context).getSerialTwentyOneTwentyThreeNewsData();
    if (apiResponse != null) {
      serialTwentyOneToTwentyThreeData = apiResponse;
    }
    notifyListeners();
  }

  void getCurrentNewsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getCurrentNewsData();
    if (apiResponse != null) {
      currentNewsData = apiResponse;
    }
    notifyListeners();
  }

  void getTrendingNewsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTrendingNewsData();
    if (apiResponse != null) {
      trendingNewsData = apiResponse;
    }
    notifyListeners();
  }

  void getCategoryData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getCategoryData();
    if (apiResponse != null) {
      categoryData = apiResponse;
    }
    notifyListeners();
  }

  void getNewsCategoryData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getNewsCategoryData();
    if (apiResponse != null) {
      newsCategoryData = apiResponse;
    }
    notifyListeners();
  }
}

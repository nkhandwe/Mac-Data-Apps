import 'package:flutter/material.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class CategoryWiseListProvider extends ChangeNotifier {
  NewsResponse? categoryWiseList;
  // late RefreshController refreshController;
  int page = 1;
  List<NewsResponse> listOfNews = <NewsResponse>[];
  bool isError = false;

  CategoryWiseListProvider(BuildContext context, String slug) {
    categoryWiseListData(context, slug);
  }

  void categoryWiseListData(BuildContext context, slug) async {
    var apiResponse =
        await RepositoryImpl(context).getCategoryWiseListApi(slug);
    if (apiResponse != null) {
      categoryWiseList = apiResponse;
      // if (apiResponse.data!.isNotEmpty) {
      //   if (page == 1) {
      //     // setItems(apiResponse.data);
      //     refreshController.loadComplete();
      //     notifyListeners();
      //   } else {
      //     // setMoreItems(data);
      //     notifyListeners();
      //   }
      // } else {
      //   refreshController.refreshCompleted();
      //   refreshController.loadNoData();
      //   notifyListeners();
      // }
    }
    notifyListeners();
  }

  loadMoreItems() {
    page = page + 1;
    // getCrmTaskListData(status ?? '0', priorityId: priority);
    notifyListeners();
  }

  // void setItems(List<NewsResponse> item) {
  //   listOfNews.clear();
  //   listOfNews = item;
  //   refreshController.refreshCompleted();
  //   isError = false;
  //   notifyListeners();
  // }

  // void setMoreItems(List<NewsResponse> item) {
  //   listOfNews.addAll(item);
  //   refreshController.loadComplete();
  //   notifyListeners();
  // }
}

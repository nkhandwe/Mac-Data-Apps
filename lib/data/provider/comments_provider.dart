import 'package:flutter/material.dart';
import 'package:landlord/data/model/comments_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class CommentsProvider extends ChangeNotifier {
  CommentsModel? commentResponsesData;


  CommentsProvider(BuildContext context) {
    commentsData(context);
  }

  void commentsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getCommentsData();
    if (apiResponse != null) {
      commentResponsesData = apiResponse;
    }
    notifyListeners();
  }

}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/interested_topic.dart';
import 'package:landlord/data/model/post_newsletter_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class InterestedTopicProvider extends ChangeNotifier {
  InterestedTopicModel? interestedTopic;
  PostNewsletterModel? postInterested;

  InterestedTopicProvider(BuildContext context) {
    interestedTopicData(context);
  }

  void interestedTopicData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getInterestedTopicData();
    if (apiResponse != null) {
      interestedTopic = apiResponse;
    }
    notifyListeners();
  }

  postInterestedTopicData(BuildContext context, id) async {
    var apiResponse = await RepositoryImpl(context).postInterestedTopicApi(id);
    if (apiResponse != null) {
      postInterested = apiResponse;
      Fluttertoast.showToast(msg: postInterested!.message!);
    }
    notifyListeners();
  }
}

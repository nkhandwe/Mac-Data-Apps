import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/bookmark_model.dart';
import 'package:provider/provider.dart';

import '../local/local_auth_provider.dart';
import '../model/news_details_model.dart';
import '../model/post_comment_model.dart';
import '../model/user_model.dart';
import '../model/vote_response_model.dart';
import '../network/repository/repository.dart';

class NewsDetailsProvider extends ChangeNotifier {
  NewsDetailsModel? newsDetailsResponse;
  PostCommentModel? postCommentResponse;
  BookmarkModel? bookmarkData;
  VoteResponseModel? voteResponse;

  UserModel? userInfo;

  final commentTextController = TextEditingController();
  final replyCommentTextController = TextEditingController();

  NewsDetailsProvider(BuildContext context, String slug) {
    newsDetailsData(context, slug);
    getUser(context);
  }

  ///news Details
  void newsDetailsData(BuildContext context, String slug) async {
    var apiResponse = await RepositoryImpl(context).getNewsDetailsData(slug);
    if (apiResponse != null) {
      newsDetailsResponse = apiResponse;
    }
    print(apiResponse);
    notifyListeners();
  }

  getUser(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    userInfo = provider.getUser();
  }

  ///post comment
  void commentPost(BuildContext context) async {
    final data = {
      "news_id": newsDetailsResponse?.data?.news?.id,
      "content": commentTextController.text,
      "user_id": userInfo?.id,
    };
    var postResponse = await RepositoryImpl(context).postComment(data);
    if (postResponse.success == true) {
      postCommentResponse = postResponse;
      Fluttertoast.showToast(
        msg: postCommentResponse?.message ?? "",
      );
      commentTextController.clear();
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    }
    notifyListeners();
  }

  ///post reply
  void commentReplyPost(BuildContext context, {required int parentId}) async {
    final data = {
      "news_id": newsDetailsResponse?.data?.news?.id,
      "content": replyCommentTextController.text,
      "user_id": userInfo?.id,
      "parent_id": parentId
    };
    var postResponse = await RepositoryImpl(context).postComment(data);
    if (postResponse.success == true) {
      postCommentResponse = postResponse;
      Fluttertoast.showToast(
        msg: postCommentResponse?.message ?? "",
      );
      replyCommentTextController.clear();
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    }
    notifyListeners();
  }

  void bookmarkApi(BuildContext context, int newsId, int langId) async {
    final data = {
      "news_id": "$newsId-$langId",
      "user_id": userInfo?.id,
    };
    var postResponse = await RepositoryImpl(context).bookmarkApi(data);
    if (postResponse.success == true) {
      bookmarkData = postResponse;
      Fluttertoast.showToast(
        msg: postCommentResponse?.message ?? "",
      );
      commentTextController.clear();
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    }
    notifyListeners();
  }

  ///like vote
  void voteMethod(BuildContext context,
      {required int commentID, required String voteType}) async {
    final data = {
      "comment_id": commentID,
      "user_id": userInfo?.id,
      "type": voteType
    };
    var postResponse = await RepositoryImpl(context).postVote(data);
    if (postResponse.success == true) {
      voteResponse = postResponse;
      Fluttertoast.showToast(
        msg: voteResponse?.message ?? "",
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    }
    notifyListeners();
  }
}

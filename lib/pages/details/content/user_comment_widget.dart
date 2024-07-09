import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_text.dart';
import '../../../data/model/news_details_model.dart';
import '../../../data/provider/news_details_provider.dart';
import '../../../utils/theme/app_colors.dart';

class UserCommentWidget extends StatefulWidget {
  const UserCommentWidget({super.key, required this.newsDetails});

  final NewsDetailsModel newsDetails;

  @override
  State<UserCommentWidget> createState() => _UserCommentWidgetState();
}

class _UserCommentWidgetState extends State<UserCommentWidget> {
  final bool isReply = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.newsDetails.data?.comments?.length ?? 0,
        itemBuilder: (ctx, i) {
          return widget.newsDetails.data?.comments != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 2.h, left: 14.w, right: 14.w, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.6),
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.person)),
                              title: CustomText(
                                text:
                                    "${widget.newsDetails.data?.comments?[i].user}",
                                fontWeight: FontWeight.w700,
                                fontSize: 12.r,
                              ),
                              subtitle: CustomText(
                                text:
                                    "${widget.newsDetails.data?.comments?[i].createdAt}",
                                fontSize: 11.r,
                              ),
                            ),
                            Text(
                              "${widget.newsDetails.data?.comments?[i].content}",
                              maxLines: 3,
                              style: TextStyle(
                                color: black2Sd,
                                fontSize: 11.r,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<NewsDetailsProvider>()
                                        .voteMethod(ctx,
                                            commentID: widget.newsDetails.data!
                                                .comments![i].id!,
                                            voteType: "p");
                                    context
                                        .read<NewsDetailsProvider>()
                                        .newsDetailsData(
                                          ctx,
                                          widget.newsDetails.data?.news?.slug ??
                                              "",
                                        );
                                  },
                                  child: widget.newsDetails.data?.comments?[i]
                                              .positiveVotes !=
                                          0
                                      ? Icon(
                                          Icons.thumb_up,
                                          color: Colors.black,
                                          size: 14.sp,
                                        )
                                      : Icon(
                                          Icons.thumb_up_alt_outlined,
                                          size: 14.sp,
                                        ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                    "${widget.newsDetails.data?.comments?[i].positiveVotes}"),
                                SizedBox(
                                  width: 14.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<NewsDetailsProvider>()
                                        .voteMethod(ctx,
                                            commentID: widget.newsDetails.data!
                                                .comments![i].id!,
                                            voteType: "n");
                                    context
                                        .read<NewsDetailsProvider>()
                                        .newsDetailsData(
                                          ctx,
                                          widget.newsDetails.data?.news?.slug ??
                                              "",
                                        );
                                  },
                                  child: widget.newsDetails.data?.comments?[i]
                                              .negativeVotes !=
                                          0
                                      ? Icon(
                                           Icons.thumb_down,
                                            color: Colors.black,
                                            size: 14.sp,
                                        )
                                      : Icon(
                                            Icons.thumb_down_alt_outlined,
                                          size: 14.sp,
                                        ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                    "${widget.newsDetails.data?.comments?[i].negativeVotes}"),
                                SizedBox(
                                  width: 14.w,
                                ),
                                Icon(
                                  Icons.reply,
                                  size: 14.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (context
                                            .read<NewsDetailsProvider>()
                                            .userInfo
                                            ?.id !=
                                        null) {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext ctx) =>
                                            AlertDialog(
                                          title: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  color: greyColor
                                                      .withOpacity(0.8)),
                                            ),
                                            child: TextField(
                                              controller: context
                                                  .read<NewsDetailsProvider>()
                                                  .replyCommentTextController,
                                              maxLines: 4, //or null
                                              decoration: const InputDecoration(
                                                hintText: "Reply",
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<NewsDetailsProvider>()
                                                    .commentReplyPost(context,
                                                        parentId: widget
                                                            .newsDetails
                                                            .data!
                                                            .comments![i]
                                                            .id!);
                                                context
                                                    .read<NewsDetailsProvider>()
                                                    .newsDetailsData(
                                                        context,
                                                        widget.newsDetails.data
                                                                ?.news?.slug ??
                                                            "");
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                              child: const Text('Send reply'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext ctx) =>
                                            AlertDialog(
                                          title: Text(
                                            "Before comment you need to login first",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "reply".tr(),
                                    style: TextStyle(
                                        color: black2Sd, fontSize: 11.r),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///child comment
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.newsDetails.data?.comments?[i]
                                .childComments?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return widget.newsDetails.data?.comments?[i]
                                      .childComments?.length !=
                                  null
                              ? Padding(
                                  padding: EdgeInsets.only(left: 50.w),
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.6),
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 14.sp,
                                                  )),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text:
                                                          "${widget.newsDetails.data?.comments?[i].childComments?[index].user}",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10.r,
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "${widget.newsDetails.data?.comments?[i].childComments?[index].createdAt}",
                                                      fontSize: 8.sp,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              "${widget.newsDetails.data?.comments?[i].childComments?[index].content}",
                                              maxLines: 3,
                                              style: TextStyle(
                                                color: black2Sd,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 8.h,
                                          // ),
                                          // Row(
                                          //   children: [
                                          //     Icon(
                                          //       Icons.thumb_up_alt_outlined,
                                          //       size: 15.sp,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 5.w,
                                          //     ),
                                          //     widget
                                          //                 .newsDetails
                                          //                 .data
                                          //                 ?.comments?[i]
                                          //                 .childComments?[index]
                                          //                 .positiveVotes ==
                                          //             null
                                          //         ? const Text("0")
                                          //         : Text(
                                          //             "${widget.newsDetails.data?.comments?[i].childComments?[index].positiveVotes}"),
                                          //     SizedBox(
                                          //       width: 14.w,
                                          //     ),
                                          //     Icon(
                                          //       Icons.thumb_down_alt_outlined,
                                          //       size: 14.sp,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 5.w,
                                          //     ),
                                          //     widget
                                          //                 .newsDetails
                                          //                 .data
                                          //                 ?.comments?[i]
                                          //                 .childComments?[index]
                                          //                 .negativeVotes ==
                                          //             null
                                          //         ? const Text("0")
                                          //         : Text(
                                          //             "${widget.newsDetails.data?.comments?[i].childComments?[index].negativeVotes}"),
                                          //     // SizedBox(
                                          //     //   width: 14.w,
                                          //     // ),
                                          //     // Text(
                                          //     //   "reply".tr(),
                                          //     //   style: TextStyle(color: black2Sd, fontSize: 11.r),
                                          //     // ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        }),

                    SizedBox(
                      height: 14.h,
                    ),
                  ],
                )
              : const SizedBox();
        });
  }
}

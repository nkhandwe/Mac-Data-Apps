import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/interested_topic/view/interested_topic_page.dart';
import 'package:landlord/pages/post_list/view/post_list_page.dart';
import 'package:landlord/pages/article/view/article_page.dart';
import 'package:landlord/pages/comments/view/comments_page.dart';
import 'package:landlord/pages/create_post/view/create_post_page.dart';
import 'package:landlord/pages/dashboard/view/dashboard_page.dart';
import 'package:landlord/pages/newsletter/view/news_letter_page.dart';
import 'package:landlord/pages/profile/content/change_password.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:remixicon/remixicon.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Sidebar Menu',
                    style:
                        TextStyle(fontSize: 16.r, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: whiteColor,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'my_account'.tr(),
                style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 6.h,
              ),
              DrawerListTile(
                title: "dashboard".tr(),
                icon: Remix.home_2_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const DashboardPage());
                },
              ),
              DrawerListTile(
                title: "profile",
                icon: Remix.profile_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const ProfileScreen());
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              // Text(
              //   'posts'.tr(),
              //   style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w700),
              // ),
              // SizedBox(
              //   height: 6.h,
              // ),
              // DrawerListTile(
              //   title: "create_post",
              //   onTap: () {
              //     NavUtil.navigateScreen(context, const CreatePostPage());
              //   },
              // ),
              // DrawerListTile(
              //   title: "post_list",
              //   onTap: () {
              //     NavUtil.navigateScreen(context, const PostListScreen());
              //   },
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              Text(
                'activities'.tr(),
                style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 6.h,
              ),
              DrawerListTile(
                title: "comments",
                icon: Remix.chat_2_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const CommentsPage());
                },
              ),
              DrawerListTile(
                title: "articles",
                icon: Remix.article_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const ArticlePage());
                },
              ),
              DrawerListTile(
                title: "interested_topic",
                icon: Remix.star_half_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const InterestedTopicPage());
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'settings'.tr(),
                style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 6.h,
              ),
              DrawerListTile(
                title: "change_password",
                icon: Remix.lock_password_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const ChangePassword());
                },
              ),
              DrawerListTile(
                title: "newsletter",
                icon: Remix.mail_settings_line,
                onTap: () {
                  NavUtil.navigateScreen(context, const NewsletterPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  const DrawerListTile({super.key, this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: 18,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                        fontSize: 12.r,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
        )
      ],
    );
  }
}

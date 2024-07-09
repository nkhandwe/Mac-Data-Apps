import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/news_category_model.dart';
import 'package:landlord/pages/comments/view/comments_page.dart';
import 'package:landlord/pages/home/content/menu_button.dart';
import 'package:landlord/pages/home/home_page.dart';
import 'package:landlord/pages/profile/content/change_password.dart';
import 'package:provider/provider.dart';

import '../../../components/elevated_button_widget.dart';
import '../../../data/local/local_auth_provider.dart';
import '../../../utils/nav_utail.dart';
import '../../../utils/theme/app_colors.dart';
import '../../login/view/login_page.dart';
import '../../profile/view/profile_screen.dart';
import '../../search/view/search_page.dart';

class NewsHomeAppBar extends StatefulWidget {
  final NewsCategoryModel? newsData;
  const NewsHomeAppBar({super.key, this.newsData});

  @override
  State<NewsHomeAppBar> createState() => _NewsHomeAppBarState();
}

class _NewsHomeAppBarState extends State<NewsHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();

    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/drawer/app_logo.png',
        height: 15.h,
        fit: BoxFit.cover,
      ),
      actions: [
        IconButton(
            padding: const EdgeInsets.only(left: 8, right: 0),
            onPressed: () {
              NavUtil.navigateScreen(context, const SearchPage());
            },
            icon: const Icon(Icons.search)),
        user?.token != null
            ? PopupMenuButton(
                color: whiteColor,
                icon: const Icon(Icons.person),
                onSelected: (value) {
                  // your logic
                },
                itemBuilder: (BuildContext ctx) {
                  return [
                    PopupMenuItem(
                      child: SizedBox(
                          child: Row(
                        children: [
                          Icon(
                            Icons.person_2_outlined,
                            size: 18.r,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text("my_profile".tr()),
                        ],
                      )),
                      onTap: () {
                        NavUtil.navigateScreen(context, const ProfileScreen());
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.mode_comment_outlined,
                            size: 18.r,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text("my_comments".tr()),
                        ],
                      ),
                      onTap: () {
                        NavUtil.navigateScreen(context, const CommentsPage());
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline_sharp,
                            size: 18.r,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text("change_password".tr()),
                        ],
                      ),
                      onTap: () {
                        NavUtil.navigateScreen(context, const ChangePassword());
                      },
                    ),
                    PopupMenuItem(
                        child: SizedBox(
                      height: 35.h,
                      child: ElevatedButtonWidget(
                        backgroundColor: Colors.black,
                        textColor: whiteColor,
                        onPressed: () {
                          context.read<LocalAuthProvider>().deleteUser();
                          Fluttertoast.showToast(msg: "Successfully Sign Out");
                          NavUtil.navigateScreen(context, const HomePage());
                        },
                        text: "sign_out".tr(),
                      ),
                    ))
                  ];
                },
              )
            : IconButton(
                onPressed: () {
                  NavUtil.navigateScreen(context, const LoginPage());
                },
                icon: const Icon(Icons.login)),
        MenuButton(
          newsData: widget.newsData,
        )
      ],
    );
  }
}

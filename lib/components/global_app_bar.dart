import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/details/content/marquee_text_widget.dart';
import 'package:landlord/pages/home/home_page.dart';
import 'package:landlord/pages/login/view/login_page.dart';
import 'package:landlord/pages/news_category/view/news_category.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/pages/search/view/search_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                NavUtil.navigateScreen(context, const HomePage());
              },
              icon: const Icon(Icons.arrow_back)),
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
                              const Icon(
                                Icons.person_2_outlined,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("my_profile".tr()),
                            ],
                          )),
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const ProfileScreen());
                          },
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.mode_comment_outlined,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("my_comments".tr()),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lock_outline_sharp,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("change_password".tr()),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                            child: SizedBox(
                          height: 36,
                          child: ElevatedButtonWidget(
                            backgroundColor: Colors.black,
                            textColor: whiteColor,
                            onPressed: () {
                              context.read<LocalAuthProvider>().deleteUser();
                              Fluttertoast.showToast(
                                  msg: "Successfully Sign Out");
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
            // PopupMenuButton(
            //   icon: const Icon(Icons.menu),
            //   onSelected: (value) {
            //     // your logic
            //   },
            //   itemBuilder: (BuildContext ctx) {
            //     return [
            //       PopupMenuItem(
            //         child: const SizedBox(child: Text("News")),
            //         onTap: () {
            //           NavUtil.navigateScreen(context, const NewsCategoryPage());
            //         },
            //       ),
            //       const PopupMenuItem(
            //         child: Text("Bangladesh"),
            //       ),
            //       const PopupMenuItem(
            //         child: Text("Sports"),
            //       ),
            //       const PopupMenuItem(
            //         child: Text("International"),
            //       ),
            //       const PopupMenuItem(
            //         child: Text("Business"),
            //       ),
            //       const PopupMenuItem(
            //         child: Text("Opinion"),
            //       ),
            //     ];
            //   },
            // ),
          ],
        ),
        const MarqueeTextWidget()
      ],
    );
  }
}

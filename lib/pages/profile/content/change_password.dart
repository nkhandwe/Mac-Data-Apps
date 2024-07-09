import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/change_password_provider.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/pages/home/home_page.dart';
import 'package:landlord/pages/login/content/auth_text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/nav_utail.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordProvider(context),
      child: Consumer<ChangePasswordProvider>(builder: (context, provider, _) {
        return Form(
          key: formKey,
          child: Scaffold(
            key: scaffoldKey,
            drawer: const NewsDrawer(),
            backgroundColor: whiteColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(DeviceUtil.isTablet ? 120 : 95),
                child: const GlobalAppBar()),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'dashboard_menu'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.r),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: InkWell(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Icon(
                              Icons.menu_outlined,
                              color: whiteColor,
                              size: 18.r,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "change_password",
                            fontSize: 16.r,
                            fontWeight: FontWeight.w600,
                          ),
                          const Divider(
                            thickness: 0.6,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AuthFromField(
                            controller: provider.currentPassController,
                            title: "current_password",
                            hintText: "enter_current_password",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AuthFromField(
                            controller: provider.newPassController,
                            title: "new_password",
                            hintText: "enter_new_password",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AuthFromField(
                            controller: provider.confirmPassController,
                            title: "retype_password",
                            hintText: "enter_retype_password",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          //ButtonSection
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      side: const BorderSide(
                                        width: 0.6,
                                        color: Colors.red,
                                      )),
                                  child: Text(
                                    'cancel'.tr(),
                                    style: TextStyle(
                                        color: redColor, fontSize: 12.r),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      provider.changePassword();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: blackColor,
                                  ),
                                  child: Text(
                                    'update'.tr(),
                                    style: TextStyle(
                                        color: whiteColor, fontSize: 12.r),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

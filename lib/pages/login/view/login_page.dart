import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/pages/login/content/auth_text_form_field.dart';
import 'package:landlord/pages/login/content/button_with_icon.dart';
import 'package:landlord/pages/register/view/register_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final formKey = GlobalKey<FormState>();
    UserLogin userLogin = UserLogin();
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(automaticallyImplyLeading: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor, width: 0.6),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset('assets/drawer/app_logo.png',
                            height: 25.h, fit: BoxFit.cover)),
                    SizedBox(height: 18.h),
                    AuthFromField(
                      title: "email_address",
                      hintText: "enter_your_email",
                      onChange: (email) {
                        userLogin.email = email;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthFromField(
                      title: "password",
                      hintText: "enter_your_password",
                      onChange: (password) {
                        userLogin.password = password;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('forgot_password'.tr(),
                          style: TextStyle(
                              color: redColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 20.h),
                    ButtonWithIcon(
                        titleColor: Colors.white,
                        color: Colors.black,
                        isIconShow: false,
                        title: 'Login'.tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // NavUtil.navigateScreen(context, const CustomBottomNavBar());
                            provider.login(
                                userLogin: UserLogin(
                                    email: userLogin.email,
                                    password: userLogin.password),
                                context: context);
                          }
                        },
                        icon: Icons.g_mobiledata),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          NavUtil.navigateScreen(context, const RegisterPage());
                        },
                        child: Text(
                          "do_not_have_an_account_register".tr(),
                          style: TextStyle(
                              color: black2Sd,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    // SizedBox(height: 18.h),
                    // ButtonWithIcon(
                    //     title:'login_with_google'.tr(), onPressed: (){},
                    //     icon: Icons.g_mobiledata),
                    // const SizedBox(height: 4),
                    // ButtonWithIcon(
                    //   title:'login_with_faceBook'.tr(), onPressed: (){},
                    //   icon: Icons.facebook_outlined)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/model/registration_model.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/pages/login/content/auth_text_form_field.dart';
import 'package:landlord/pages/login/view/login_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = Provider.of<AuthProvider>(context);
    UserRegistration userRegistration = UserRegistration();
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: greyColor, width: 0.6),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/drawer/app_logo.png',
                          height: 25.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AuthFromField(
                        title: "name",
                        hintText: "enter_your_name".tr(),
                        onChange: (name) {
                          userRegistration.name = name;
                        },
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AuthFromField(
                        title: "email_address",
                        hintText: "Enter Your Email",
                        onChange: (email) {
                          userRegistration.email = email;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AuthFromField(
                        title: "password",
                        hintText: "enter_your_password",
                        onChange: (password) {
                          userRegistration.password = password;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AuthFromField(
                        title: "confirm_password",
                        hintText: "enter_your_confirm_password",
                        onChange: (confirmPassword) {
                          userRegistration.confirmPassword = confirmPassword;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'forgot_password'.tr(),
                          style: TextStyle(
                              color: redColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (userRegistration.password ==
                                    userRegistration.confirmPassword) {
                                  provider.registration(
                                      userRegistration: userRegistration,
                                      context: context);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                            'Password_and_confirm_password',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ).tr()));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: blackColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                side: const BorderSide(
                                  width: 0.6,
                                  color: Colors.black,
                                )),
                            child: Text(
                              'register'.tr(),
                              style: const TextStyle(color: whiteColor),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            NavUtil.navigateScreen(context, const LoginPage());
                          },
                          child: Text(
                            "already_have_an_account_login".tr(),
                            style: TextStyle(
                                color: black2Sd,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: whiteColor,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(8)),
                      //           side: const BorderSide(
                      //             width: 0.6,
                      //             color: Colors.black,
                      //           )),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           const Icon(Icons.facebook_outlined),
                      //           SizedBox(
                      //             width: 6.w,
                      //           ),
                      //           Text(
                      //             'login_with_google'.tr(),
                      //             style: const TextStyle(color: blackColor),
                      //           ),
                      //         ],
                      //       )),
                      // ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: whiteColor,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(8)),
                      //           side: const BorderSide(
                      //             width: 0.6,
                      //             color: Colors.black,
                      //           )),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           const Icon(Icons.facebook_outlined),
                      //           const SizedBox(
                      //             width: 6,
                      //           ),
                      //           Text(
                      //             'login_with_faceBook'.tr(),
                      //             style: const TextStyle(color: blackColor),
                      //           ),
                      //         ],
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

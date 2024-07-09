import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/pages/create_post/content/create_drop_down.dart';
import 'package:landlord/pages/create_post/content/create_upload_content.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/pages/login/content/auth_text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      drawer: const NewsDrawer(),
      backgroundColor: whiteColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(DeviceUtil.isTablet ? 120 : 95),
          child: const GlobalAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              DashboardDrawerContent(scaffoldKey: scaffoldKey),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'create_news'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.r),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      thickness: 0.6,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    AuthFromField(
                      title: "title".tr(),
                      hintText: "",
                      textColor: black2Sd,
                      fillColor: greyColor.withOpacity(0.04),
                      onChange: (p0) {},
                    ),

                    const CreateDropDownItem(), //DropDownItem
                    SizedBox(
                      height: 20.h,
                    ),

                    const CreateUploadContent(), //UploadContent
                    SizedBox(
                      height: 10.h,
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
                                    borderRadius: BorderRadius.circular(8)),
                                side: const BorderSide(
                                  width: 0.6,
                                  color: Colors.red,
                                )),
                            child: Text(
                              'cancel'.tr(),
                              style: TextStyle(color: redColor, fontSize: 12.r),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: blackColor,
                            ),
                            child: Text(
                              'submit'.tr(),
                              style:
                                  TextStyle(color: whiteColor, fontSize: 12.r),
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

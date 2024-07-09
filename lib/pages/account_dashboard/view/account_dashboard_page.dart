import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/interested_topic/view/interested_topic_page.dart';
import 'package:landlord/pages/post_list/view/post_list_page.dart';
import 'package:landlord/pages/profile/content/edit_profile_screen.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AccountDashboardPage extends StatelessWidget {
  const AccountDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Account Dashboard",
            style: TextStyle(fontSize: 18),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Account",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            DashboardListTile(
              title: "My Profile",
              onTap: () {
                NavUtil.navigateScreen(context, const ProfileScreen());
              },
            ),
            DashboardListTile(
              title: "Edit profile",
              onTap: () {
                NavUtil.navigateScreen(context, const EditProfileScreen());
              },
            ),
            const DashboardListTile(title: "User Dashboard"),
            const SizedBox(height: 12),
            const Text(
              "Activities",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const DashboardListTile(title: "My Comments"),
            const DashboardListTile(title: "Saved Articles"),
            DashboardListTile(
              title: "My Interested Topic",
              onTap: () {
                NavUtil.navigateScreen(context, const InterestedTopicPage());
              },
            ),
            DashboardListTile(
              title: "News List",
              onTap: () {
                NavUtil.navigateScreen(context, const PostListScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardListTile extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const DashboardListTile({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            children: [
              Text(
                title ?? "",
                style: TextStyle(fontSize: 12.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

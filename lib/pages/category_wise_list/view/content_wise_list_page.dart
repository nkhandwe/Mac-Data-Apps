import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/category_wise_list_provider.dart';
import 'package:landlord/pages/home/content/common_news_widget.dart';
import 'package:landlord/pages/login/view/login_page.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/pages/search/view/search_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryWiseListPage extends StatefulWidget {
  final String? slug;
  const CategoryWiseListPage({super.key, this.slug});

  @override
  State<CategoryWiseListPage> createState() => _CategoryWiseListPageState();
}

class _CategoryWiseListPageState extends State<CategoryWiseListPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();
    return ChangeNotifierProvider(
      create: (context) => CategoryWiseListProvider(context, widget.slug!),
      child:
          Consumer<CategoryWiseListProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/drawer/app_logo.png',
                height: 15.h,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  onPressed: () {
                    NavUtil.navigateScreen(context, const SearchPage());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  padding: const EdgeInsets.only(right: 16),
                  onPressed: () {
                    setState(() {
                      if (user?.id != null) {
                        NavUtil.navigateScreen(context, const ProfileScreen());
                      } else {
                        NavUtil.navigateScreen(context, const LoginPage());
                      }
                    });
                  },
                  icon: const Icon(Icons.person)),
            ],
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: provider.categoryWiseList?.data?.isEmpty == false
                ? CommonNewsWidget(provider: provider.categoryWiseList)
                : const CustomRectangularCard(),
          )),
        );
      }),
    );
  }
}

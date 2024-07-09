import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
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
            onPressed: () {},
            icon: const Icon(Icons.search)),
        IconButton(
            padding: const EdgeInsets.only(right: 16),
            onPressed: () {},
            icon: const Icon(Icons.login)),
      ],
    );
  }
}

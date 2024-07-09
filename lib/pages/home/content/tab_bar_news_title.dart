import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarNewsTitle extends StatelessWidget {
  const TabBarNewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _SliverAppBarDelegate(
            TabBar(labelStyle: TextStyle(fontSize: 14.r), tabs: [
      Tab(
        text: "current_news".tr(),
      ),
      Tab(
        text: "trending_news".tr(),
      ),
    ])));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

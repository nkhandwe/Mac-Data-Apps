import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdMobCard extends StatelessWidget {
  const AdMobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      CachedNetworkImage(
        // height: DeviceUtil.isTablet ? 200.h : 160.h,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl:
            "https://news.iisbd.io/frontend/assets/images/gallery/google-ads1.png",
        placeholder: (context, url) => Center(
          child: Image.asset("assets/images/no_image_found.png"),
        ),
        errorWidget: (context, url, error) =>
            Image.asset("assets/images/no_image_found.png"),
      ),
    ]));
  }
}

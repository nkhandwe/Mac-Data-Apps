import 'package:flutter/material.dart';

enum PhoneType { phone, tablet }

extension GetDeviceType on BuildContext {
  PhoneType getDeviceType() {
    // ignore: deprecated_member_use
    final size = MediaQueryData.fromView(WidgetsBinding.instance.window);

    if (size.size.shortestSide < 500) {
      return PhoneType.phone;
    }
    return PhoneType.tablet;
  }
}

import 'package:flutter/material.dart';

class DeviceUtil {
  static get _getDeviceType {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);
    return data.size.shortestSide < 600 ? 'phone' :'tablet';
  }

  static bool get isTablet {
    return _getDeviceType == 'tablet';
  }
}
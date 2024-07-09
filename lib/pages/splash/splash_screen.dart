import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/home/home_page.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    Future.delayed(const Duration(seconds: 3), () async {
      Utils.initDio();
      if (provider.getUser() != null) {
        GlobalState.instance.set('token', provider.getUser()?.token);
      }
      NavUtil.navigateScreen(context, const HomePage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/drawer/auth_background.png",
          ),
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/drawer/app_logo.png',
          height: 146.w,
        ),
      ),
    ));
  }
}

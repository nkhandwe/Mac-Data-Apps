import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/provider/auth_provider.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/pages/splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  ///initializeFirebaseAtStatingPoint
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(userBoxName);

  ///top-level function
  ///to handle background messaging

  FirebaseMessaging.instance.subscribeToTopic('oxonews');

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BN'),
        Locale('ar', 'AR')
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<LocalAuthProvider>(create: (context) => LocalAuthProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(context)),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF0F3F5),
            useMaterial3: true,
            textTheme: GoogleFonts.manropeTextTheme(
              Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.deepPurple,
          ),
          home: const SplashScreen(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child);
            return child;
          },
        ),
      ),
    );
  }
}

///Handle background messaging service
///It must not be an anonymous function.
/// It must be a top-level function (e.g. not a class method which requires initialization).


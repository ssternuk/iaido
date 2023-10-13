import 'package:flutter/material.dart';
import 'package:iaido/firebase_options.dart';
import 'package:get/get.dart';

import 'package:iaido/ui/constants/themes.dart';
import 'package:iaido/ui/views/vw_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iaido/ui/views/vw_pay.dart';
import 'package:iaido/ui/views/vw_to_who.dart';
import 'package:iaido/ui/views/vw_topup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var sharedPreferences = await SharedPreferences.getInstance();
  if (await sharedPreferences.getString("deviceId") == null)
    await sharedPreferences.setString("deviceId", Uuid().v4());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoneyApp',
      initialRoute: '/vw_dashboard',
      getPages: AppRoutes.routes(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: clrPrimary,
        scaffoldBackgroundColor: clrPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: clrPrimary),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
    );
  }
}

class AppRoutes {
  static routes() => [
        GetPage(
          name: '/vw_to_who',
          page: () => VwToWho(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/vw_pay',
          page: () => VwPay(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/vw_topup',
          page: () => VwTopup(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/vw_dashboard',
          page: () => VwDashboard(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ];
}

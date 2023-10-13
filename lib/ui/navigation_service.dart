// import 'package:flutter/material.dart';

// class NavigationService extends Navigator {
//   factory NavigationService() => _instance;

//   NavigationService._internal();
//   static final NavigationService _instance = NavigationService._internal();

//   final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

//   dynamic goBack() => navigationKey.currentState!.pop(1);

//   Future<dynamic> navigateToScreen(Widget page) async =>
//       navigationKey.currentState!.push(
//         MaterialPageRoute(
//           builder: (_) => page,
//         ),
//       );

//   Future<dynamic> pushAndRemoveUntil(Widget page, String routeName) async =>
//       navigationKey.currentState!.pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => page),
//         ModalRoute.withName(routeName),
//       );

//   Future<dynamic> replaceScreen(Widget page) async =>
//       navigationKey.currentState!.pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => page,
//         ),
//       );

//   void popToFirst() =>
//       navigationKey.currentState!.popUntil((route) => route.isFirst);

//   void of(BuildContext context, Widget returnView) {
//     Navigator.of(context, rootNavigator: true)
//         .push(MaterialPageRoute(builder: (context) => returnView));
//   }

//   void pop(BuildContext context, {int popCount = 1}) {
//     var count = 0;
//     Navigator.popUntil(context, (_) => count++ >= popCount);
//   }

//   void goToRoute(BuildContext context, String routeName, Object? arguments) {
//     Navigator.pushNamed(context, routeName, arguments: arguments);
//   }
// }


// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDTt2Qv_yy6jiqoZ0b6tIquSdzedpNoZ7Q',
    appId: '1:1032174880251:web:51394680a64ce1d940f75e',
    messagingSenderId: '1032174880251',
    projectId: 'iaido-e97c5',
    authDomain: 'iaido-e97c5.firebaseapp.com',
    storageBucket: 'iaido-e97c5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLpdfvkLN1lDJ7ziPHPmbVSjwszsx49rA',
    appId: '1:1032174880251:android:22f75f1562b490f640f75e',
    messagingSenderId: '1032174880251',
    projectId: 'iaido-e97c5',
    storageBucket: 'iaido-e97c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqP0K01UcMad7CeK9yLNtQr85BDR_uWNw',
    appId: '1:1032174880251:ios:73bdd365c37837da40f75e',
    messagingSenderId: '1032174880251',
    projectId: 'iaido-e97c5',
    storageBucket: 'iaido-e97c5.appspot.com',
    iosBundleId: 'com.iaido.app.iaido',
  );
}

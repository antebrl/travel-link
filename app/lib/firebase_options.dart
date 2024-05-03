// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCq6nBZCYnjvPv1RG4Gv_E7AoP397kS0qg',
    appId: '1:645505180626:web:1ed955544a3b87841cde0b',
    messagingSenderId: '645505180626',
    projectId: 'travel-link1',
    authDomain: 'travel-link1.firebaseapp.com',
    storageBucket: 'travel-link1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwVCuyHudxjZvQGTK9v6Po1H5HJ4HoIpU',
    appId: '1:645505180626:android:1cf00fc0ecd669c31cde0b',
    messagingSenderId: '645505180626',
    projectId: 'travel-link1',
    storageBucket: 'travel-link1.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCq6nBZCYnjvPv1RG4Gv_E7AoP397kS0qg',
    appId: '1:645505180626:web:a58d465da8aa93981cde0b',
    messagingSenderId: '645505180626',
    projectId: 'travel-link1',
    authDomain: 'travel-link1.firebaseapp.com',
    storageBucket: 'travel-link1.appspot.com',
  );

}
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBWYLZpjAMuzbRpQtJXKpUCZU956KCTsVU',
    appId: '1:393805196999:web:20fb8b4c730b8790a0d8e2',
    messagingSenderId: '393805196999',
    projectId: 'fir-a48b3',
    authDomain: 'fir-a48b3.firebaseapp.com',
    storageBucket: 'fir-a48b3.appspot.com',
    measurementId: 'G-988P11LQ56',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNi-mFzIC3alfZgY9yAPPGADkxTz6BB-o',
    appId: '1:393805196999:android:78119e695f3c89a7a0d8e2',
    messagingSenderId: '393805196999',
    projectId: 'fir-a48b3',
    storageBucket: 'fir-a48b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASgsmclYy00bAusItY0c9z0oLrLR54f7c',
    appId: '1:393805196999:ios:bf98e9d9ebd6b8afa0d8e2',
    messagingSenderId: '393805196999',
    projectId: 'fir-a48b3',
    storageBucket: 'fir-a48b3.appspot.com',
    iosBundleId: 'com.example.firebaseApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASgsmclYy00bAusItY0c9z0oLrLR54f7c',
    appId: '1:393805196999:ios:bf98e9d9ebd6b8afa0d8e2',
    messagingSenderId: '393805196999',
    projectId: 'fir-a48b3',
    storageBucket: 'fir-a48b3.appspot.com',
    iosBundleId: 'com.example.firebaseApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWYLZpjAMuzbRpQtJXKpUCZU956KCTsVU',
    appId: '1:393805196999:web:6c5272f544c6486ca0d8e2',
    messagingSenderId: '393805196999',
    projectId: 'fir-a48b3',
    authDomain: 'fir-a48b3.firebaseapp.com',
    storageBucket: 'fir-a48b3.appspot.com',
    measurementId: 'G-PC841CM0J3',
  );
}
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
        return macos;
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
    apiKey: 'AIzaSyDOsx35cOAt83QtcGcjtWmoyuMadSKZseo',
    appId: '1:287577280783:web:18517699119cefd214ee7a',
    messagingSenderId: '287577280783',
    projectId: 'green-live-acs',
    authDomain: 'green-live-acs.firebaseapp.com',
    databaseURL: 'https://green-live-acs-default-rtdb.firebaseio.com',
    storageBucket: 'green-live-acs.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTP4MEE-sRkU00D5kYCY3z3JX94lZxS9g',
    appId: '1:287577280783:android:a86f60ceb97b798814ee7a',
    messagingSenderId: '287577280783',
    projectId: 'green-live-acs',
    databaseURL: 'https://green-live-acs-default-rtdb.firebaseio.com',
    storageBucket: 'green-live-acs.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlK38jDXjUvfVez_MXaY1zUHDJvzf5aNs',
    appId: '1:287577280783:ios:f7188e41aa19887714ee7a',
    messagingSenderId: '287577280783',
    projectId: 'green-live-acs',
    databaseURL: 'https://green-live-acs-default-rtdb.firebaseio.com',
    storageBucket: 'green-live-acs.appspot.com',
    iosClientId: '287577280783-6hfgm5rifv73e99tt5m3jup3pf1v8cab.apps.googleusercontent.com',
    iosBundleId: 'com.example.greenLiveAcs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlK38jDXjUvfVez_MXaY1zUHDJvzf5aNs',
    appId: '1:287577280783:ios:64b56b5cffcfc6a814ee7a',
    messagingSenderId: '287577280783',
    projectId: 'green-live-acs',
    databaseURL: 'https://green-live-acs-default-rtdb.firebaseio.com',
    storageBucket: 'green-live-acs.appspot.com',
    iosClientId: '287577280783-grrr48fb36vr2c1j3fqmf94e2ek7pf2k.apps.googleusercontent.com',
    iosBundleId: 'com.example.greenLiveAcs.RunnerTests',
  );
}

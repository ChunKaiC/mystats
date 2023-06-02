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
    apiKey: 'AIzaSyACgDQ9PC3TsIssU0-8AlQdru1QVrG671E',
    appId: '1:552420716349:web:7231129f1780571a921f54',
    messagingSenderId: '552420716349',
    projectId: 'mystats-60507',
    authDomain: 'mystats-60507.firebaseapp.com',
    storageBucket: 'mystats-60507.appspot.com',
    measurementId: 'G-7F6MVC4DLF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuoAOeTYXkKJ_UnRTzAhNJQDb9ylrFwxA',
    appId: '1:552420716349:android:a2c2f22bef95201b921f54',
    messagingSenderId: '552420716349',
    projectId: 'mystats-60507',
    storageBucket: 'mystats-60507.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7B79RA6qg4fA7ZnJ6zJ_5W2l_XiGQIx8',
    appId: '1:552420716349:ios:f95036a1d4f033e1921f54',
    messagingSenderId: '552420716349',
    projectId: 'mystats-60507',
    storageBucket: 'mystats-60507.appspot.com',
    iosClientId: '552420716349-3vg7c6knhmoukk64h5iol2jio2a79b7i.apps.googleusercontent.com',
    iosBundleId: 'com.example.mystats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7B79RA6qg4fA7ZnJ6zJ_5W2l_XiGQIx8',
    appId: '1:552420716349:ios:f95036a1d4f033e1921f54',
    messagingSenderId: '552420716349',
    projectId: 'mystats-60507',
    storageBucket: 'mystats-60507.appspot.com',
    iosClientId: '552420716349-3vg7c6knhmoukk64h5iol2jio2a79b7i.apps.googleusercontent.com',
    iosBundleId: 'com.example.mystats',
  );
}

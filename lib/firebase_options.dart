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
    apiKey: 'AIzaSyBAIdPqAGUpqfAMnSXWAnbXGlT3djxdokM',
    appId: '1:972910120426:web:1056573428290326093693',
    messagingSenderId: '972910120426',
    projectId: 'nutrinow-58c0c',
    authDomain: 'nutrinow-58c0c.firebaseapp.com',
    storageBucket: 'nutrinow-58c0c.appspot.com',
    measurementId: 'G-2SN0X7099K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlk4QcYi7RSbX07r7gQxo_ZBzWA5G3K0w',
    appId: '1:972910120426:android:3056adb2238efb5b093693',
    messagingSenderId: '972910120426',
    projectId: 'nutrinow-58c0c',
    storageBucket: 'nutrinow-58c0c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0jxPlAsp_8MkWBiI_JmHwOJjFhYKPcso',
    appId: '1:972910120426:ios:096a3676bd44143d093693',
    messagingSenderId: '972910120426',
    projectId: 'nutrinow-58c0c',
    storageBucket: 'nutrinow-58c0c.appspot.com',
    androidClientId: '972910120426-oqub48jullnf2o6221p0ffcjhjufsu89.apps.googleusercontent.com',
    iosClientId: '972910120426-29mip7686gh6hpdudmqtnec8mlrkqp4n.apps.googleusercontent.com',
    iosBundleId: 'com.example.nutrinow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0jxPlAsp_8MkWBiI_JmHwOJjFhYKPcso',
    appId: '1:972910120426:ios:096a3676bd44143d093693',
    messagingSenderId: '972910120426',
    projectId: 'nutrinow-58c0c',
    storageBucket: 'nutrinow-58c0c.appspot.com',
    androidClientId: '972910120426-oqub48jullnf2o6221p0ffcjhjufsu89.apps.googleusercontent.com',
    iosClientId: '972910120426-29mip7686gh6hpdudmqtnec8mlrkqp4n.apps.googleusercontent.com',
    iosBundleId: 'com.example.nutrinow',
  );
}

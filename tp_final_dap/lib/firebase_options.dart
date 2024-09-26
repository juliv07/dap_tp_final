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
    apiKey: 'AIzaSyBJDR7bJpSKYsYiDDJejJQoJtqYkQeSj1Q',
    appId: '1:780386437987:web:d7fae219d7c3d1fcde2156',
    messagingSenderId: '780386437987',
    projectId: 'dap-tp-final',
    authDomain: 'dap-tp-final.firebaseapp.com',
    storageBucket: 'dap-tp-final.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi38m2zeIsly1rytxVx0T9rkiPjtuVWMw',
    appId: '1:780386437987:android:cfe3b3dfbf04c912de2156',
    messagingSenderId: '780386437987',
    projectId: 'dap-tp-final',
    storageBucket: 'dap-tp-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOG2ZTVjRPJ1yl9K9yjGlkxmezHpttHfg',
    appId: '1:780386437987:ios:490c606fb4ae0cf4de2156',
    messagingSenderId: '780386437987',
    projectId: 'dap-tp-final',
    storageBucket: 'dap-tp-final.appspot.com',
    iosBundleId: 'com.example.tpFinalDap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOG2ZTVjRPJ1yl9K9yjGlkxmezHpttHfg',
    appId: '1:780386437987:ios:490c606fb4ae0cf4de2156',
    messagingSenderId: '780386437987',
    projectId: 'dap-tp-final',
    storageBucket: 'dap-tp-final.appspot.com',
    iosBundleId: 'com.example.tpFinalDap',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJDR7bJpSKYsYiDDJejJQoJtqYkQeSj1Q',
    appId: '1:780386437987:web:51a62c81d9584f34de2156',
    messagingSenderId: '780386437987',
    projectId: 'dap-tp-final',
    authDomain: 'dap-tp-final.firebaseapp.com',
    storageBucket: 'dap-tp-final.appspot.com',
  );
}

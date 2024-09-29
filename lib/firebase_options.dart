import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtPTzVRY5xG4kOuQx-maNhPA-SOw4dbUY',
    appId: '1:1077930819082:android:c05b5012f88477fde8a9f3',
    messagingSenderId: '1077930819082',
    projectId: 'enorsia-efb8a',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpNZVIkMo584X2XqHv8WADqvNdv00eGy8',
    appId: '1:1077930819082:ios:0db7e847252fef08e8a9f3',
    messagingSenderId: '1077930819082',
    projectId: 'enorsia-efb8a',
    iosClientId:
        '1077930819082-et39fqc92u0rp9sro67ub302s83hqrq7.apps.googleusercontent.com',
    iosBundleId: 'com.example.tukitakiFlutter',
  );
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAwzeS6B4DDrfF1aIyKupGwIHKImSCduMI",
            authDomain: "envioly-b5680.firebaseapp.com",
            projectId: "envioly-b5680",
            storageBucket: "envioly-b5680.appspot.com",
            messagingSenderId: "520195915309",
            appId: "1:520195915309:web:8afd6a8172e2553e5fc2a4",
            measurementId: "G-VWRE04NJPV"));
  } else {
    await Firebase.initializeApp();
  }
}

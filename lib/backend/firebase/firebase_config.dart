import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCJ6_lOalATw3v-XlHJK6K43gyq5aaw5FM",
            authDomain: "afro-tango-g6fj7t.firebaseapp.com",
            projectId: "afro-tango-g6fj7t",
            storageBucket: "afro-tango-g6fj7t.firebasestorage.app",
            messagingSenderId: "766518736455",
            appId: "1:766518736455:web:9aec1eed4cb4654a23e362",
            measurementId: "G-TVH5W51LER"));
  } else {
    await Firebase.initializeApp();
  }
}

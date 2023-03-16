import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCyb-e5FfLvccpXdN2R5yUCyfH1mIfA454",
            authDomain: "adamsolskab.firebaseapp.com",
            projectId: "adamsolskab",
            storageBucket: "adamsolskab.appspot.com",
            messagingSenderId: "433670515802",
            appId: "1:433670515802:web:e251890cd661fbb2a4fc63",
            measurementId: "G-EK5V5GRT3L"));
  } else {
    await Firebase.initializeApp();
  }
}

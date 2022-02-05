import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: "AIzaSyBJ6BlqKDbmWY1jI08ayv3v5Gz3mhI8OXQ",
      authDomain: "pillsreminder-marieqp.firebaseapp.com",
      projectId: "pillsreminder-marieqp",
      storageBucket: "pillsreminder-marieqp.appspot.com",
      messagingSenderId: "10702431668",
      appId: "1:10702431668:web:43fe62f30af93f671dbee1");

  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const App());
}

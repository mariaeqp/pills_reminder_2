import 'package:flutter/material.dart';
import 'package:pillsreminder/app/screens/add_screen/add_screen.dart';
import 'package:pillsreminder/app/screens/edit_screen/edit_screen.dart';
import 'package:pillsreminder/app/screens/home_screen/home_screen.dart';
import 'package:pillsreminder/app/screens/login_screen/login_screen.dart';
import 'package:pillsreminder/app/screens/register_screen/register_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "medium",
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/home.dart';
import 'package:mymoney/login.dart';
import 'package:mymoney/myroutes.dart';
import 'package:mymoney/signin.dart';
import 'package:mymoney/splashscreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static var isMobile = false, isLaptop = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const splashscreen(),
        routes: {
          myroutes.login: (context) => const login(),
          myroutes.splashscreen: (context) => const splashscreen(),
          myroutes.signin :(context) => const signin(),
          myroutes.home:(context) => const home()
        });
  }

  void fun() {
    print("in function");
  }
}

import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomSplash(
        imagePath: 'assets/combine.png',
        home: MyApp(),
        backGroundColor: Color(0xFFF1F1F2),
        logoSize: 200,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
      ),
    );
  }
}

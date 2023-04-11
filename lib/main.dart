import 'package:flutter/material.dart';
import 'package:haba/screens/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haba',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home:  const Directionality(
          textDirection: TextDirection.rtl, // set this property
          child: SplashScreen()),
      // set textDirection to right-to-left

    );
  }
}

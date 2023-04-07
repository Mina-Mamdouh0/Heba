
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/Layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.greenColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Constant.greenColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset('${Constant.imagePath}logo.png',fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}

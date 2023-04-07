import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/constant.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('Call Us',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('''
Formal since the fifteenth century when an unknown printing press stacked a group of letters randomly taken from a text, to be a booklet as a guide or a formal reference for these letters. Five centuries did not eliminate this text, but it even became used in its original form in printing and electronic typesetting. It became popular in the 1960s with the release of Letraset chips.
              ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/constant.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('Contact Us',style: TextStyle(
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0XFFD9D9D9),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Call ',style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                        ),),
                        const SizedBox(height: 10,),
                        Text('01122548033  ',style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                        ),),

                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Constant.blackColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.call,color: Colors.white),
                      ),
                    )

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0XFFD9D9D9),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                        ),),
                        const SizedBox(height: 10,),
                        Text('Example@example.com',style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                        ),),

                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Constant.blackColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.email,color: Colors.white),
                      ),
                    )

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

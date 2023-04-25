import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class OurVision extends StatelessWidget {
  const OurVision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('Our Vision',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('''
The needs of others for things we have and do not need is a certainty.

              ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18,    decoration: TextDecoration.underline,

              ),),
              Text('''
But the difficulty lies in finding these people,

     ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18,    decoration: TextDecoration.underline,

              ),),
              Text('''
Our vision: is for others to benefit from these items and reuse them without the need to get rid of them , build communication and a helping hand between members of the community

     ''',style: TextStyle(
                  color: Constant.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                decoration: TextDecoration.underline,

              ),),



            ],
          ),
        ),
      ),
    );
  }
}

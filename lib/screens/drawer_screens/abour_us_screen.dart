import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('About Us',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('''
From  United Arab Emirates, the Emirate of Dubai the Heba Charity platform is launched to the world, its main objectives are as follows
              ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              Text('''
1- Benefit from a lot of things that others have and they do not need

     ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              Text('''
2- Reuse many things instead of getting rid of them


     ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              Text('''
3- Building a link of communication and a helping hand among community members

 ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              Text('''
4- Maintain a clean environment by reducing waste

 ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
              Text('''
5- Building the qualities of love of giving and helping all segments of society
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

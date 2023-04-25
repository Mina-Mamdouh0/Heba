import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('How it works',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color:Colors.grey.withOpacity(0.1) ,
                    border: Border.all(color: Colors.grey.withOpacity(0.6), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Layer 2.png',width: 110,),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Fill all details',style: TextStyle(
                        color: Constant.greenColor,fontWeight: FontWeight.bold,fontSize: 18
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Fill all item detials ',style: TextStyle(
                        color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                    ),),
                    const Text('and your contact ',style: TextStyle(
                        color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                    ),),
                    const Text('information',style: TextStyle(
                        color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                    ),),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color:Colors.grey.withOpacity(0.1) ,
                    border: Border.all(color: Colors.grey.withOpacity(0.6), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Group 203.png',width: 200,),


                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.grey.withOpacity(0.1) ,
                  border: Border.all(color: Colors.grey.withOpacity(0.6), width: 2),
                  borderRadius: BorderRadius.circular(10)),
                width: 300,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Group 212.png',width: 110,),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Receive call and donate',style: TextStyle(
                        color: Constant.greenColor,fontWeight: FontWeight.bold,fontSize: 18
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('You will receive call',style: TextStyle(
                        color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                    ),),
                    const Text('to identify location and time',style: TextStyle(
                        color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                    ),),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

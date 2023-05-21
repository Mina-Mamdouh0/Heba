
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba/translations/locale_keys.g.dart';

import '../../constant.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text(LocaleKeys.howItWorks.tr(),style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/Group 202.svg',width: 110,),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(LocaleKeys.uploadAPicture.tr(),style: TextStyle(
                          color: Constant.greenColor,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(LocaleKeys.uploadClearPicture.tr(),style: const TextStyle(
                          color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                      ),),
                      Text(LocaleKeys.forDonate.tr(),style: const TextStyle(
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
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Layer 2.png',width: 110,),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(LocaleKeys.fillDetails.tr(),style: TextStyle(
                          color: Constant.greenColor,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(LocaleKeys.fillAllItemDetails.tr(),style: const TextStyle(
                          color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                      ),),
                       Text(LocaleKeys.andYourContact.tr(),style: const TextStyle(
                          color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                      ),),
                       Text(LocaleKeys.information.tr(),style:const  TextStyle(
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
                      Image.asset('assets/images/Group 212.png',width: 110,),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(LocaleKeys.receiveCallDonate.tr(),style: TextStyle(
                          color: Constant.greenColor,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(LocaleKeys.youReceiveCall.tr(),style: const TextStyle(
                          color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                      ),),
                       Text(LocaleKeys.identifyLocationTime.tr(),style: const TextStyle(
                          color: Constant.black,fontWeight: FontWeight.w300,fontSize: 18
                      ),),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

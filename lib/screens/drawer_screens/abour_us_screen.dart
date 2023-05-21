import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haba/translations/locale_keys.g.dart';

import '../../constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
          title:  Text(LocaleKeys.aboutUS.tr(),style: TextStyle(
            color:  Constant.blackColor,fontWeight: FontWeight.bold,
          )),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.15,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    //height:  MediaQuery.of(context).size.height*0.27,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('${Constant.imagePath}transportation-logistics-container-cargo-ship-cargo-plane-3d-rendering-illustration 1.png'),
                        )
                    ),
                  ),
                  Center(
                    child: Text(LocaleKeys.aboutUS.tr(),style: TextStyle(
                      color:  Constant.white,fontWeight: FontWeight.bold,
                      fontSize: 22
                    )),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(LocaleKeys.aboutText1.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Text(LocaleKeys.aboutText2.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Text(LocaleKeys.aboutText3.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Text(LocaleKeys.aboutText4.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Text(LocaleKeys.aboutText5.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  Text(LocaleKeys.aboutText6.tr(),style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),

                  const SizedBox(height: 20,),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

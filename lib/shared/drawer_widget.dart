
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/add_screen.dart';
import 'package:haba/screens/contact_us_screen.dart';
import 'package:haba/screens/drawer_screens/abour_us_screen.dart';
import 'package:haba/screens/drawer_screens/how_it_works_screen.dart';
import 'package:haba/screens/drawer_screens/our_vision_screen.dart';
import 'package:haba/translations/locale_keys.g.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 10.0,
      width: MediaQuery.of(context).size.width*0.75,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 80,
                  child:Image.asset('assets/images/logo.png',fit: BoxFit.fill) ,


                ),

              ],
            ),
            const SizedBox(height: 10,),

            ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPageView()));
              },
              contentPadding: const EdgeInsets.all(5),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(LocaleKeys.donate.tr(),
                    textAlign :TextAlign.justify,
                    style: TextStyle(
                    color: Constant.white,

                    fontSize: 18,fontWeight: FontWeight.w400
                )),
              ),

              shape: RoundedRectangleBorder( //<-- SEE HERE
                borderRadius: BorderRadius.circular(40),
              ),
              tileColor:  Colors.red ,
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.white),
            ),
            const SizedBox(height: 10,),

            ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUsScreen()));
              },
              contentPadding: const EdgeInsets.all(5),
              title: Text(LocaleKeys.aboutUS.tr(),style: TextStyle(
                  color: Constant.blackColor,
                  fontSize: 16,fontWeight: FontWeight.w400
              )),
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
            ),

            const SizedBox(height: 10,),

            ListTile(
              onTap: (){
                BlocProvider.of<AppCubit>(context).getOurVision();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OurVision()));
              },
              contentPadding: const EdgeInsets.all(5),
              title: Text(LocaleKeys.ourVision.tr(),style: TextStyle(
                  color: Constant.blackColor,
                  fontSize: 16,fontWeight: FontWeight.w400
              )),
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
            ),

            const SizedBox(height: 10,),

            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HowItWorksScreen()));
              },
              contentPadding: const EdgeInsets.all(5),
              title: Text(LocaleKeys.howItWorks.tr(),style: TextStyle(
                  color: Constant.blackColor,
                  fontSize: 16,fontWeight: FontWeight.w400
              )),
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
            ),

            const SizedBox(height: 10,),

            ListTile(
              onTap: (){
                BlocProvider.of<AppCubit>(context).getContactUs();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUsScreen()));

              },
              contentPadding: const EdgeInsets.all(5),
              title: Text(LocaleKeys.contactUs.tr(),style: TextStyle(
                  color: Constant.blackColor,
                  fontSize: 16,fontWeight: FontWeight.w400
              )),
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
            ),

            const SizedBox(height: 10,),

            ListTile(
              onTap: (){},
              contentPadding: const EdgeInsets.all(5),
              title: Text(LocaleKeys.tellFriend.tr(),style: TextStyle(
                  color: Constant.blackColor,
                  fontSize: 16,fontWeight: FontWeight.w400
              )),
              trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
            ),
            const SizedBox(height: 10,),


            BlocBuilder<AppCubit,AppState>(
                builder: (context, state){
                  return ListTile(
                    onTap: ()async{
                      if(context.locale == const Locale('ar')){
                        BlocProvider.of<AppCubit>(context).changeLunApp(context: context, lun: 'en');
                        SharedPreferences pref=await SharedPreferences.getInstance();
                        pref.setString('Lung', 'en');

                      }else{
                        BlocProvider.of<AppCubit>(context).changeLunApp(context: context, lun: 'ar');
                        SharedPreferences pref=await SharedPreferences.getInstance();
                        pref.setString('Lung', 'ar');
                      }
                      Navigator.pop(context);
                    },
                    contentPadding: const EdgeInsets.all(5),
                    title: Text(LocaleKeys.changeLanguage.tr(),style: TextStyle(
                        color: Constant.blackColor,
                        fontSize: 16,fontWeight: FontWeight.w400
                    )),
                    trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Widget show({required BuildContext context,
  required Function() camera,
  required Function() multi,
}){
  return AlertDialog(
    title: Text(
      LocaleKeys.chooseImage.tr(),
      style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: camera,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:  [
                const Icon(Icons.photo,color: Colors.green,),
                const SizedBox(width: 10,),
                Text(LocaleKeys.camera.tr(),
                  style: const TextStyle(
                      color: Colors.green,fontSize: 20
                  ),)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: multi,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:  [
                const Icon(Icons.camera,color: Colors.green,),
                const SizedBox(width: 10,),
                Text(LocaleKeys.multiImage.tr(),
                  style: const TextStyle(
                      color: Colors.green,fontSize: 20
                  ),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

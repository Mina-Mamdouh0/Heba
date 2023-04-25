
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/contact_us_screen.dart';
import 'package:haba/screens/drawer_screens/abour_us_screen.dart';

import '../screens/add_screen.dart';
import '../screens/drawer_screens/how_it_works_screen.dart';
import '../screens/drawer_screens/our_vision_screen.dart';

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
                 Container(
                   width: 120,
                   height: 80,
                     child:SvgPicture.asset('assets/images/logoo.svg',fit: BoxFit.fill) ,


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
               title: Text('Donate',style: TextStyle(
                 color: Constant.blackColor,
                 fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Donation is Here',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),
             const SizedBox(height: 10,),

             ListTile(
               onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => AboutUsScreen()));
    },
               contentPadding: const EdgeInsets.all(5),
               title: Text('ABOUT US',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Donation is Here',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),

             const SizedBox(height: 10,),

             ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>OurVision()));
               },
               contentPadding: const EdgeInsets.all(5),
               title: Text('OUR VISION',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Donation is Here',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),

             const SizedBox(height: 10,),

             ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HowItWorksScreen()));

               },
               contentPadding: const EdgeInsets.all(5),
               title: Text('HOW IT WORKS',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Donation is Here',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),

             const SizedBox(height: 10,),

             ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsScreen()));

               },
               contentPadding: const EdgeInsets.all(5),
               title: Text('Contact Us',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Donation is Here',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),

             const SizedBox(height: 10,),

             ListTile(
               onTap: (){},
               contentPadding: const EdgeInsets.all(5),
               title: Text('TELL A FRIEND',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Change to arabic',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),
             const SizedBox(height: 10,),

             ListTile(
               onTap: (){},
               contentPadding: const EdgeInsets.all(5),
               title: Text('Change language',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 16,fontWeight: FontWeight.w400
               )),
               subtitle: Text('Change to arabic',style: TextStyle(
                   color: Constant.blackColor,
                   fontSize: 14,fontWeight: FontWeight.w300
               )),
               trailing: Icon(Icons.arrow_forward_ios,color: Constant.greenColor),
             ),
           ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/call_us_screen.dart';
import 'package:haba/screens/contact_us_screen.dart';

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
                   decoration: BoxDecoration(

                     image: DecorationImage(
                       image: AssetImage('${Constant.imagePath}logo.png'),
                       fit: BoxFit.fill
                     )
                   ),
                 ),

               ],
             ),
             const SizedBox(height: 10,),

             ListTile(
               onTap: (){},
               contentPadding: const EdgeInsets.all(5),
               leading: Icon(FontAwesomeIcons.add,color: Constant.redColor,),
               title: Text('Donation',style: TextStyle(
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
               leading: Icon(FontAwesomeIcons.tencentWeibo,color: Constant.redColor,),
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
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>CallUsScreen()));

               },
               contentPadding: const EdgeInsets.all(5),
               leading: Icon(FontAwesomeIcons.mobile,color: Constant.redColor,),
               title: Text('Call Us',style: TextStyle(
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
               leading: Icon(Icons.g_translate,color: Constant.redColor,),
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

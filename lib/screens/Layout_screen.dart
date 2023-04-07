
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/add_screen.dart';
import 'package:haba/screens/donation_screen.dart';
import 'package:haba/screens/home_screen.dart';
import 'package:haba/shared/drawer_widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
int currentIndex=0;
final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
List<Widget> listScreen=[
  HomeScreen(),
  FormPageView()
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
       body: listScreen[currentIndex],
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           _scaffoldKey.currentState!.openDrawer();
         },
         backgroundColor: Constant.greenColor,
         child: const Icon(FontAwesomeIcons.add ,),
       ),
       floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value){
          setState(() {
            currentIndex=value;
          });
        },
        elevation: 10.0,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        selectedItemColor: Constant.greenColor,
        unselectedItemColor: Constant.blackColor,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(icon:Icon( FontAwesomeIcons.houseMedical,),label: 'Home'),
          BottomNavigationBarItem(icon:Icon( FontAwesomeIcons.handPointer,),label: 'Donation'),
        ],
      ),

    );
  }
}

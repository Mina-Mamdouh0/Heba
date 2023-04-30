
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/add_screen.dart';
import 'package:haba/screens/donation_screen.dart';
import 'package:haba/screens/home_screen.dart';
import 'package:haba/shared/drawer_two.dart';
import 'package:haba/shared/drawer_widget.dart';
import 'package:haba/translations/locale_keys.g.dart';

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
      appBar: AppBar(
        backgroundColor: Constant.greenColor,
        actions: <Widget>[
          Builder(
            builder: (context){
              return IconButton(
                icon: Icon(Icons.filter_list_sharp),
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),

      key: _scaffoldKey,
      drawer: const DrawerWidget(),
       endDrawer: DrawerWidget2(),
       body: listScreen[currentIndex],
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
        items: [
          BottomNavigationBarItem(icon:const Icon( FontAwesomeIcons.houseMedical,),label: LocaleKeys.home.tr()),

          BottomNavigationBarItem(icon:const Icon( FontAwesomeIcons.circleDollarToSlot,),label: LocaleKeys.donation.tr()),
        ],
      ),
    );
  }
}

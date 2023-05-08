
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/add_screen.dart';
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

final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
List<Widget> listScreen=[
  HomeScreen(),
  FormPageView()
];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
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
              body: listScreen[cubit.currentIndex],
              floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
              bottomNavigationBar: BottomNavigationBar(
                onTap: (int value){
                  cubit.changeIndex(value);

                },
                elevation: 10.0,
                backgroundColor: Colors.white,
                currentIndex: cubit.currentIndex,
                showSelectedLabels: true,
                selectedItemColor: Constant.greenColor,
                unselectedItemColor: Constant.blackColor,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(icon:const Icon( FontAwesomeIcons.houseMedical,),label: LocaleKeys.home.tr()),

                  BottomNavigationBarItem(icon:const Icon( FontAwesomeIcons.boxOpen,),label: LocaleKeys.donation.tr()),
                ],
              )
          );
        }, listener: (context,state){});
  }
}

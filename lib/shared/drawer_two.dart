
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/call_us_screen.dart';
import 'package:haba/screens/contact_us_screen.dart';

class DrawerWidget2 extends StatelessWidget {
  const DrawerWidget2({Key? key}) : super(key: key);

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
            TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Search',
                prefixIcon: Icon(Icons.search,color: Constant.greenColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Constant.blackColor,
                    )
                ),

              ),
            ),
            const SizedBox(height: 10,),

            DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'e',
                    child: Text('Category'),
                  ),
                  DropdownMenuItem(
                    value: 'a',
                    child: Text('Category'),
                  ),
                ], onChanged: (val){},
                decoration:InputDecoration(
                  label: const Text('Category'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Constant.blackColor,
                      )
                  ),

                )
            ),
            const SizedBox(height: 10,),

            DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'e',
                    child: Text('Category'),
                  ),
                  DropdownMenuItem(
                    value: 'a',
                    child: Text('Category'),
                  ),
                ], onChanged: (val){},
                decoration:InputDecoration(
                  label: const Text('Category'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Constant.blackColor,
                      )
                  ),

                ) ),
            const SizedBox(height: 10,),

            DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: 'e',
                    child: Text('Category'),
                  ),
                  DropdownMenuItem(
                    value: 'a',
                    child: Text('Category'),
                  ),
                ], onChanged: (val){},
                decoration:InputDecoration(
                  label: const Text('Category'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Constant.blackColor,
                      )
                  ),

                ) ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}

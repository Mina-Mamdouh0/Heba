import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../shared/defult_text.dart';

class AvailableFormScreen extends StatelessWidget {
  const AvailableFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constant.greenColor,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace_sharp),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("يمكنك تعبئة الحقول أدناه ليصيلك إشعار فور توفر عناصر مشابهة.",style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.bold,
                color: Constant.red
              ),),
              const SizedBox(
                height: AppSize.s15,
              ),

              Row(
                children: const [
                  Text(
                    "الاسم",
                    style: AppStyles.s18,
                  ),
                  Text(
                    "*",
                    style: AppStyles.s14r,
                  ),
                ],
              ),
              SizedBox(
                width: 330,
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your first name';
                  },
                  decoration: InputDecoration(
                    hintText: 'الاسم كامل',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Constant.grayColor,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Row(
                children: const [
                  Text(
                    "الهاتف",
                    style: AppStyles.s18,
                  ),
                  Text(
                    "*",
                    style: AppStyles.s14r,
                  ),
                ],
              ),
              SizedBox(
                width: 330,
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your first name';
                  },
                  decoration: InputDecoration(
                    hintText: '+9715XXXXXXXXX',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Constant.grayColor,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Row(
                children: const [
                  Text(
                    "البريد الالكتروني",
                    style: AppStyles.s18,
                  ),
                  Text(
                    "*",
                    style: AppStyles.s14r,
                  ),
                ],
              ),
              SizedBox(
                width: 330,
                height: 45,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your first name';
                  },
                  decoration: InputDecoration(
                    hintText: 'email@email.com',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Constant.grayColor,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

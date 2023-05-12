import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';

import '../constant.dart';
import '../shared/defult_text.dart';
import '../translations/locale_keys.g.dart';

class AvailableFormScreen extends StatelessWidget {
  AvailableFormScreen({Key? key}) : super(key: key);

  final TextEditingController name=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController subject=TextEditingController();
  final TextEditingController msg=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.greenColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.keyboard_backspace_sharp),
        ),
      ),
      body: BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(LocaleKeys.youCanFill.tr(),style:const  TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold,
                      color: Constant.red
                  ),),
                  const SizedBox(
                    height: AppSize.s15,
                  ),

                  Row(
                    children:  [
                      Text(
                        LocaleKeys.theName.tr(),
                        style: AppStyles.s18,
                      ),
                      const Text(
                        "*",
                        style: AppStyles.s14r,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 45,
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) return LocaleKeys.pleaseEnterName.tr();
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.fullName.tr(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  Row(
                    children:  [
                      Text(
                        LocaleKeys.phone.tr(),
                        style: AppStyles.s18,
                      ),
                      const Text(
                        "*",
                        style: AppStyles.s14r,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 45,
                    child: TextFormField(
                      controller: phone,
                      validator: (value) {
                        if (value!.isEmpty) return LocaleKeys.pleaseEnterPhone.tr();
                      },
                      decoration: InputDecoration(
                        hintText: '+ 9715XXXXXXXXX',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  Row(
                    children:  [
                      Text(
                        LocaleKeys.email.tr(),
                        style: AppStyles.s18,
                      ),
                      const Text(
                        "*",
                        style: AppStyles.s14r,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 45,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) return LocaleKeys.pleaseEnterEmail.tr();
                      },
                      decoration: InputDecoration(
                        hintText: 'email@email.com',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  Row(
                    children:  [
                      Text(
                        LocaleKeys.subject.tr(),
                        style: AppStyles.s18,
                      ),
                      const Text(
                        "*",
                        style: AppStyles.s14r,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 330,
                    height: 45,
                    child: TextFormField(
                      controller: subject,
                      validator: (value) {
                        if (value!.isEmpty) return LocaleKeys.pleaseEnterEmail.tr();
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.contactMassage.tr(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  Row(
                    children:   [
                      Text(
                        LocaleKeys.msg.tr(),
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
                      controller: msg,
                      validator: (value) {
                        if (value!.isEmpty) return LocaleKeys.pleaseEnterEmail.tr();
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.contactForm.tr(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSize.s15,
                  ),

                  (state is LoadingFormSearch)?
                  const Center(child: CircularProgressIndicator(),):InkWell(
                    onTap: () {
                      cubit.uploadForm(msg: msg.text,
                          subject: subject.text,
                          email: email.text,
                          phone: phone.text,
                          name: name.text,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Constant.greenColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Center(
                          child: Text(
                            LocaleKeys.submit.tr(),
                            style:const TextStyle(color: Colors.white, fontSize: 17.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context,state){
          if(state is SuccessFormSearch){
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
      )
    );
  }
}

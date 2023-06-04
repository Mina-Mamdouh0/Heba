import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/screens/Layout_screen.dart';

import '../constant.dart';
import '../shared/defult_text.dart';
import '../translations/locale_keys.g.dart';

class AvailableFormScreen extends StatelessWidget {
  final String city;
  final String category;
  final String cauntry;
  final String search;
  AvailableFormScreen({Key? key, required this.city, required this.category, required this.cauntry, required this.search}) : super(key: key);

  final TextEditingController name=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();

  final _formKey = GlobalKey<FormState>();


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
              child: Form(
                key: _formKey ,
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
                      children:   [
                        Text(
                          LocaleKeys.fullName.tr(),
                          style: AppStyles.s18,
                        ),
                        Text(
                          "*",
                          style: AppStyles.s14r,
                        ),
                      ],
                    ),
                    TextFormField(
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
                    TextFormField(
                      keyboardType: TextInputType.phone,
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
                    TextFormField(
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


                    const SizedBox(
                      height: AppSize.s15,
                    ),

                    (state is LoadingFormNotSearch)?
                    const Center(child: CircularProgressIndicator(),):
                    InkWell(
                      onTap: () {
                        if ( _formKey.currentState!.validate()){
                          cubit.avabileForm(
                              email: email.text,
                              phone: phone.text,
                              name: name.text,
                              country: cauntry,
                              city: city,
                              category: category,
                              query: search);
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: '',
                              builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                width: 400,
                                height: 200,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text(
                                      LocaleKeys.availableItems.tr(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                     Text(
                                      LocaleKeys.sendReq.tr(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      width: 120,
                                      height: 30,
                                      child: Container(
                                        color: Colors.green,
                                        child: ElevatedButton(

                                          onPressed: () =>
                                              Navigator.of(context).pop(), child: Text(LocaleKeys.exit.tr()),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                          });
                        }


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
            ),
          );
        },
        listener: (context,state){
          if(state is SuccessFormNotSearch){
            Navigator.pop(context);
            Navigator.pop(context);
          }else if (state is ErrorFormNotSearch){
            toast(LocaleKeys.tryAgain.tr());
          }
        },
      )
    );
  }
}

class MassageSearchScreen extends StatelessWidget {
  const MassageSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.greenColor,
        automaticallyImplyLeading: true,
        title: Text(LocaleKeys.msg.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text('massssss'),

            const SizedBox(
              height: AppSize.s15,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
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
  }
}


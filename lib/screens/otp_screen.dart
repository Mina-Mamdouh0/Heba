import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';

import '../constant.dart';
import '../shared/defult_text.dart';
import '../translations/locale_keys.g.dart';
import 'Layout_screen.dart';

class OtpScreen extends StatelessWidget {
  final String userId;
   OtpScreen({Key? key, required this.userId}) : super(key: key);
  final TextEditingController code=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocaleKeys.authentication.tr()),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children:  [
                      Text(
                        LocaleKeys.authenticationCode.tr(),
                        style: AppStyles.s18,
                      ),
                      Text(
                        "*",
                        style: AppStyles.s14r,
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: code,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your first name';
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.enterSix.tr(),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Constant.grayColor,
                      contentPadding: const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  (state is LoadingOtp)?
                  const Center(child: CircularProgressIndicator(),):
                  InkWell(
                    onTap: () {
                      cubit.verifyOTP(
                        code: code.text,
                        uuid: userId,
                      );
                    },
                    child: Container(
                      width: 300.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Constant.greenColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Center(
                          child: Text(
                            LocaleKeys.submit.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 17.0),
                          )),
                    ),
                  ),

                  const SizedBox(
                    height: AppSize.s15,
                  ),

                  (state is LoadingReSend)?
                  const Center(child: CircularProgressIndicator(),):
                  InkWell(
                    onTap: () {
                      cubit.reSendOTP(
                        userId: userId
                      );
                    },
                    child: Container(
                      width: 300.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Constant.greenColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Center(
                          child: Text(
                            LocaleKeys.resend.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 17.0),
                          )),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
        listener: (context,state){
          if(state is SuccessOtp){
            BlocProvider.of<AppCubit>(context).changeIndex(0);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
          }
        },
      )
    );
  }
}

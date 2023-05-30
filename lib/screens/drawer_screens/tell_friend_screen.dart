import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/shared/defult_text.dart';
import 'package:haba/translations/locale_keys.g.dart';

class TellFriendScreen extends StatelessWidget {
   TellFriendScreen({Key? key}) : super(key: key);

   TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text(LocaleKeys.tellFriend.tr(),style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),
      ),
      body:BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.15,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      //height:  MediaQuery.of(context).size.height*0.27,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('${Constant.imagePath}transportation-logistics-container-cargo-ship-cargo-plane-3d-rendering-illustration 1.png'),
                          )
                      ),
                    ),
                    Center(
                      child: Text(LocaleKeys.tellFriend.tr(),style: TextStyle(
                          color:  Constant.white,fontWeight: FontWeight.bold,
                          fontSize: 22
                      )),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                      height: 8,
                    ),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your email';
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.email.tr(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Constant.grayColor,
                        contentPadding: const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s15,
                    ),
                    (state is LoadingTallFriend)?
                    const Center(child: CircularProgressIndicator(),):
                    InkWell(
                      onTap: () {
                        if(email.text.isNotEmpty){
                          cubit.tellFriend(
                              email: email.text
                          );
                        }
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
                              LocaleKeys.sendMassage.tr(),
                              style: TextStyle(color: Colors.white, fontSize: 17.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (context,state){
          if(state is SuccessTallFriend){
           Navigator.pop(context);
           Navigator.pop(context);
          }
        },
      ),
    );
  }
}

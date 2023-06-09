import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';

import '../../constant.dart';
import '../../translations/locale_keys.g.dart';

class OurVision extends StatelessWidget {
  const OurVision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
        builder: (context, state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Constant.greenColor,
              title:  Text(context.locale == const Locale('ar')?cubit.ourVisionModel.nameAr??'':cubit.ourVisionModel.name??'',
                  style: TextStyle(
                color:  Constant.blackColor,fontWeight: FontWeight.bold,
              )),

            ),
            body: RefreshIndicator(
              onRefresh: ()async{
                cubit.getOurVision();
              },
              child: (state is LoadingGetOurVision)?
              const Center(child: CircularProgressIndicator(),):
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(

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
                                  image: AssetImage('${Constant.imagePath}pp.png'),
                                )
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            //height:  MediaQuery.of(context).size.height*0.27,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('${Constant.imagePath}transportation-logistics-container-cargo-ship-cargo-plane-3d-rendering-illustration 2 (1).png'),
                                )
                            ),
                          ),
                          Center(
                            child: Text(LocaleKeys.ourVision.tr(),style: TextStyle(
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
                        children: [
                          Text(context.locale == const Locale('ar')?cubit.ourVisionModel.descriptionAr??'':cubit.ourVisionModel.description??'',
                        softWrap: true,overflow: TextOverflow.visible,
                        style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18,decoration: TextDecoration.underline,

                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state){});
  }
}

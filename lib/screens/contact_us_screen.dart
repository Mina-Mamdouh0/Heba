
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/shared/defult_text.dart';
import 'package:haba/translations/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

  final TextEditingController name=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController subject=TextEditingController();
  final TextEditingController msg=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context, state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Constant.greenColor,
              title:  Text(context.locale == const Locale('ar')?cubit.contactModel.nameAr??'':cubit.contactModel.name??'',
                  style: TextStyle(
                color:  Constant.blackColor,fontWeight: FontWeight.bold,
              )),

            ),
            body: (state is LoadingGetContactUs)?
            const Center(child: CircularProgressIndicator(),):
            RefreshIndicator(
              onRefresh: ()async{
                cubit.getContactUs();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(context.locale == const Locale('ar')?cubit.contactModel.descriptionAr??'':cubit.contactModel.description??'',
                        softWrap: true,overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                      ),),
                      const SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cubit.contactModel.facebook!=null?InkWell(
                              onTap: ()async{
                                if (await canLaunch( cubit.contactModel.facebook!)) {
                                await launch( cubit.contactModel.facebook!);
                                } else {
                                throw 'Could not launch';
                                }
                              },
                              child: SvgPicture.asset('assets/images/icons8-facebook.svg',)):Container(),
                          cubit.contactModel.instagram!=null?InkWell(
                              onTap: ()async{
                                if (await canLaunch( cubit.contactModel.facebook!)) {
                                  await launch( cubit.contactModel.facebook!);
                                } else {
                                  throw 'Could not launch';
                                }
                              },
                              child: SvgPicture.asset('assets/images/icons8-instagram.svg',)):Container(),
                          cubit.contactModel.snapchat!=null?InkWell(
                              onTap: ()async{
                                if (await canLaunch( cubit.contactModel.snapchat!)) {
                                  await launch( cubit.contactModel.snapchat!);
                                } else {
                                  throw 'Could not launch';
                                }
                              },
                              child: SvgPicture.asset('assets/images/icons8-snapchat.svg',)):Container(),
                          cubit.contactModel.tiktok!=null?InkWell(
                              onTap: ()async{
                                if (await canLaunch( cubit.contactModel.tiktok!)) {
                                  await launch( cubit.contactModel.tiktok!);
                                } else {
                                  throw 'Could not launch';
                                }
                              },
                              child: SvgPicture.asset('assets/images/icons8-tiktok.svg',)):Container(),
                          cubit.contactModel.youtube!=null?InkWell(
                              onTap: ()async{
                                if (await canLaunch( cubit.contactModel.youtube!)) {
                                  await launch( cubit.contactModel.youtube!);
                                } else {
                                  throw 'Could not launch';
                                }
                              },
                              child: SvgPicture.asset('assets/images/icons8-youtube.svg',)):Container(),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LocaleKeys.call.tr(),style: TextStyle(
                                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                                  ),),
                                  const SizedBox(height: 10,),
                                  Directionality(
                                    textDirection: ui.TextDirection.ltr,
                                    child: Text(cubit.contactModel.mobile??'',
                                      style: TextStyle(
                                        color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                                    ),),
                                  ),

                                ],
                              ),
                            ),

                            InkWell(
                              onTap: ()async{
                                bool? res = await FlutterPhoneDirectCaller.callNumber(cubit.contactModel.mobile??'');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Constant.blackColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(Icons.call,color: Colors.white),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LocaleKeys.email.tr(),style: TextStyle(
                                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                                  ),),
                                  const SizedBox(height: 10,),
                                  Text(cubit.contactModel.email??'',style: TextStyle(
                                      color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                                  ),),

                                ],
                              ),
                            ),
                            InkWell(
                              onTap: ()async{
                                if (await canLaunch("mailto:${cubit.contactModel.email??''}")) {
                                  await launch("mailto:${cubit.contactModel.email??''}");
                                } else {
                                  throw 'Could not launch';
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Constant.blackColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(Icons.email,color: Colors.white),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          const SizedBox(height: 10,),

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
                                    LocaleKeys.sendMassage.tr(),
                                    style:const TextStyle(color: Colors.white, fontSize: 17.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state){});
  }
}

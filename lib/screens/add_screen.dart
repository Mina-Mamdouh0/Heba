
import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/otp_screen.dart';
import 'package:haba/shared/defult_text.dart';
import 'package:haba/translations/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/app_state.dart';
import '../shared/drawer_widget.dart';

class FormPageView extends StatefulWidget {
  @override
  _FormPageViewState createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int pageIndex = 0;
  PageController page = PageController(initialPage: 0);

  int showName=0;

  String? dropdownvalue;
  String? valCategory;
  String? valSubCategory;
  String? valCountries;
  String? valCities;


  String? contactType;
  int contact=0;
  var contactTypeList = [
    LocaleKeys.email.tr(),
    LocaleKeys.phone.tr(),
  ];

  bool _isChecked = false;
  final TextEditingController name=TextEditingController();
  final TextEditingController decs=TextEditingController();
  final TextEditingController nameDontion=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController address=TextEditingController();




  void _nextPage(int index) {
    page.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linearToEaseOut);

  }

  @override
  void initState() {
    super.initState();
    if(BlocProvider.of<AppCubit>(context).countriesList.isEmpty){
      BlocProvider.of<AppCubit>(context).getCountries();
    }
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      context.locale==const Locale('ar')?'1':'1 Day',
      context.locale==const Locale('ar')?'3':'3 Day',
      context.locale==const Locale('ar')?'7':'7 Day',
      context.locale==const Locale('ar')?'10':'10 Day',
      context.locale==const Locale('ar')?'15':'15 Day',
      context.locale==const Locale('ar')?'30':'30 Day',
      context.locale==const Locale('ar')?'60':'60 Day',
      context.locale==const Locale('ar')?'90':'90 Day',
      context.locale==const Locale('ar')?'دائما':'Always',
    ];
    return BlocConsumer<AppCubit , AppState>(builder: (context , state){
      var cubit = AppCubit.get(context);
      return Scaffold(
        body: Form(
            key: _formKey,
            child: PageView(
                pageSnapping: true,
                controller: page,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset('assets/images/pp.png'),
                          const SizedBox(
                            height: AppSize.s36,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.purposeImage.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(context: context,
                                  builder: (context){
                                    return show(context: context,
                                        camera: ()async{
                                          Navigator.pop(context);
                                          XFile? picked=await ImagePicker().pickImage(source: ImageSource.camera,maxHeight: 1080,maxWidth: 1080);
                                          if(picked !=null){
                                            cubit.changeListImage(picked.path);
                                          }
                                        },
                                        multi: ()async{
                                          Navigator.pop(context);
                                          List<XFile>? picked=await ImagePicker().pickMultiImage(maxHeight: 1080,maxWidth: 1080);
                                          if(picked.isNotEmpty){
                                            for (var element in picked) {
                                              cubit.changeListImage(element.path);
                                            }
                                          }
                                        }
                                    );
                                  });
                            },
                            child: Container(
                              width: 330,
                              height: 100,
                              color: Constant.grayColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.addImage.tr(),
                                    style: AppStyles.s24,
                                  ),
                                  const SizedBox(
                                    width: AppSize.s25,
                                  ),
                                  const Icon(
                                    Icons.add_a_photo,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),

                          cubit.fileList.isNotEmpty?
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.fileList.length,
                                itemBuilder: (context,index){
                                  return Container(
                                    width: 90,
                                    height: 90,
                                    margin: const EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Constant.primaryColor)
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.file(cubit.fileList[index],fit: BoxFit.fill,height: 90,width: 90),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: ()=>cubit.deleteImageOfferDetails(index),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              margin: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                  color: Color(0XFFCD0000),
                                                  shape: BoxShape.circle
                                              ),
                                              child: const Center(child: Icon(Icons.clear,size: 10,color: Colors.white,)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  );
                                }),
                          ):Container(),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.nameImage.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value!.isEmpty){
                                return LocaleKeys.pleaseEnterYourName.tr();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.exampleBlueShirt.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.category.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          DropdownButtonFormField(
                              items:  [
                                DropdownMenuItem(
                                  value: 'e',
                                  child: Text(LocaleKeys.didNotSpecify.tr()),
                                ),
                                ...cubit.categoryList.map((e){
                                  return DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(context.locale==const Locale('ar')?e.arName??'':e.name??''),
                                  );
                                }),
                              ],
                              value: valCategory,
                              onChanged: (String? val){
                                if(val!=null){
                                  if(valCategory=='e'){
                                    valCategory='-1';
                                  }else{
                                    cubit.getSubCategories(subCategoryIndex: val.toString());
                                    valCategory=val.toString();
                                  }
                                }
                              },
                              decoration:InputDecoration(
                                label:Text(LocaleKeys.category.tr()),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Constant.grayColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),

                              )
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),


                        (state is LoadingGetSubCategory)?
                        const Center(child: CircularProgressIndicator(),):
                        (cubit.subCategoryList.isNotEmpty)?
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                LocaleKeys.subCategory.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          DropdownButtonFormField(
                              items:  [
                                DropdownMenuItem(
                                  value: 'e',
                                  child: Text(LocaleKeys.didNotSpecify.tr()),
                                ),
                                ...cubit.subCategoryList.map((e){
                                  return DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(context.locale==const Locale('ar')?e.arName??'':e.name??''),
                                  );
                                }),
                              ],
                              value: valSubCategory,
                              onChanged: (String? val){
                                if(val!=null){
                                  if(valSubCategory=='e'){
                                    valSubCategory=null;
                                  }else{
                                    valSubCategory=val.toString();
                                  }
                                }
                              },
                              decoration:InputDecoration(
                                label:Text(LocaleKeys.category.tr()),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Constant.grayColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),

                              )
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                        ],
                      ):Container(),


                          Row(
                            children: [
                              Text(
                                LocaleKeys.availableUpTo.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          DropdownButtonFormField(
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Constant.grayColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),

                              ),
                              value: dropdownvalue,
                              icon: null,
                              isExpanded: true,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if(newValue==(context.locale==const Locale('ar')?'دائما':'Always')){
                                    dropdownvalue = '-1';
                                  }else{
                                    dropdownvalue = newValue!;
                                  }

                                });
                              },
                              alignment: Alignment.centerLeft),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children:  [
                              Text(
                                LocaleKeys.itemD.tr(),
                                style: AppStyles.s18,
                              ),
                              Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            maxLines: 6,
                            controller: decs,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.itemDD.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return LocaleKeys.returnN.tr();
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          InkWell(
                            onTap: (){
                              if (_formKey.currentState!.validate()) {
                                _nextPage(++pageIndex);
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
                                    LocaleKeys.next.tr(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/pp.png'),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back_ios),
                                      onPressed: (){
                                        if (_formKey.currentState!.validate()) {
                                          _nextPage(--pageIndex);
                                        }
                                      },
                                    ),
                                  )

                                ],
                              )),
                          const SizedBox(
                            height: AppSize.s36,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.nameDonor.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: nameDontion,
                            validator: (value) {
                              if (value!.isEmpty)
                                return LocaleKeys.pleaseEnterYourFirstName.tr();
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.exampleBlueShirt.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (value) {
                                  if(value!){
                                    showName=0;
                                  }else{
                                    showName=1;
                                  }
                                  setState(() {
                                    _isChecked = value;
                                  });
                                },
                                activeColor: Colors.green,
                              ),
                              Text(LocaleKeys.wantDisplayName.tr())
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s36,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.methodOfCommunication.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          DropdownButtonFormField(
                              decoration:InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Constant.grayColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),

                              ),
                              hint: Text(contactTypeList[0]),
                              value: contactType,
                              icon: null,
                              isExpanded: true,
                              items: contactTypeList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if(newValue==LocaleKeys.phone.tr()){
                                  contact=1;
                                }else{
                                  contact=0;
                                }
                                setState(() {
                                  contactType = newValue!;
                                });
                              },
                              alignment: Alignment.centerLeft),
                          const SizedBox(
                            height: AppSize.s36,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.phone.tr(),
                                style: AppStyles.s18,
                              ),
                              contact==1?const Text(
                                "*",
                                style: AppStyles.s14r,
                              ):Container(),
                            ],
                          ),
                          TextFormField(
                            controller: phone,
                            validator: (value) {
                              if (value!.isEmpty && contact==1){
                                return LocaleKeys.pleaseEnterYourPhone.tr();
                              }

                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.phone.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.email.tr(),
                                style: AppStyles.s18,
                              ),
                              contact==0?const Text(
                                "*",
                                style: AppStyles.s14r,
                              ):Container()
                            ],
                          ),
                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty && contact==0){
                                return LocaleKeys.pleaseEnterYourEmail.tr();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.email.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LocaleKeys.countries.tr(),
                                          style: AppStyles.s18,
                                        ),
                                        const Text(
                                          "*",
                                          style: AppStyles.s14r,
                                        ),
                                      ],
                                    ),
                                    (state is LoadingGetCountries)?
                                    const Center(child: CircularProgressIndicator(),):
                                    (state is LoadingGetCities)?Container():
                                    DropdownButtonFormField(
                                        decoration:InputDecoration(
                                          border: InputBorder.none,
                                          label:  Text(LocaleKeys.countries.tr()),
                                          filled: true,
                                          fillColor: Constant.grayColor,
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),

                                        ),
                                        isExpanded: true,
                                        items:  [
                                          DropdownMenuItem(
                                            value: 'e',
                                            child: Text(LocaleKeys.didNotSpecify.tr()),
                                          ),
                                          ...cubit.countriesList.map((e){
                                            return DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(context.locale==const Locale('ar')?e.nameAr??'':e.name??'',softWrap: true,overflow: TextOverflow.ellipsis),
                                            );
                                          }),
                                        ],
                                        value: valCountries,
                                        onChanged: (String? val){
                                          if(val!=null){
                                            if(valCountries=='e'){
                                              valCountries='-1';
                                            }else{
                                              valCountries=val.toString();
                                              cubit.getCities(countryID: valCountries??'');
                                            }
                                          }

                                        },

                                    ),
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LocaleKeys.cities.tr(),
                                          style: AppStyles.s18,
                                        ),
                                        const Text(
                                          "*",
                                          style: AppStyles.s14r,
                                        ),
                                      ],
                                    ),
                                    (state is LoadingGetCities)?
                                    const Center(child: CircularProgressIndicator(),):
                                    DropdownButtonFormField(
                                        items:  [
                                          DropdownMenuItem(
                                            value: 'e',
                                            child: Text(LocaleKeys.didNotSpecify.tr()),
                                          ),
                                          ...cubit.citiesList.map((e){
                                            return DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(context.locale==const Locale('ar')?e.nameAr??'':e.name??''),
                                            );
                                          }),
                                        ],
                                        value: valCities,
                                        onChanged: (String? val){
                                          if(val!=null){
                                            if(valCities=='e'){
                                              valCities='-1';
                                            }else{
                                              valCities=val.toString();
                                            }
                                          }

                                        },
                                        decoration:InputDecoration(
                                          border: InputBorder.none,
                                          label:  Text(LocaleKeys.cities.tr()),
                                          filled: true,
                                          fillColor: Constant.grayColor,
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),

                                        ),
                                    ),
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.address.tr(),
                                style: AppStyles.s18,
                              ),
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: address,
                            validator: (value) {
                              if (value!.isEmpty){
                                return LocaleKeys.pleaseEnterYourAddress.tr();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.buildingNumber.tr(),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          (state is LoadingFormDontion)?
                          const Center(child: CircularProgressIndicator(),):InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate() && (valCountries!=null ||  valSubCategory!=null) ) {
                                if((contact==0 && email.text.isNotEmpty)||(contact==1 && phone.text.isNotEmpty)){
                                  cubit.uploadDonation(
                                      description: decs.text,
                                      name: nameDontion.text,
                                      email: email.text,
                                      address: address.text,
                                      cityId: int.parse(valCities??'-1'),
                                      categoryId:int.parse(valCategory??valSubCategory!),
                                      title: name.text,
                                      contactType: contact,
                                      mobile: phone.text,
                                      showName: showName,
                                      validFor: dropdownvalue!
                                  );
                                }

                              }
                            },
                            child: Container(
                              width: 300.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Constant.greenColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                    LocaleKeys.submit.tr(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
      );
    }, listener: (context , state){
      if(state is SuccessFormDontion){
        BlocProvider.of<AppCubit>(context).fileList=[];
        if(state.msg=='2'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(userId:state.userID)));
        }else{
          BlocProvider.of<AppCubit>(context).changeIndex(0);
        }

      }
      else if(state is ErrorFormDontion){
        toast(LocaleKeys.tryAgain.tr());
      }
    });
  }
}

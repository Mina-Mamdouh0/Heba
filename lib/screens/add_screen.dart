import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/constant.dart';
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
  String? valCountries;
  String? valCities;
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  String? contactType;
  int contact=0;
  var contactTypeList = [
    'هاتف',
    'بريد الالكتروني',
  ];
  bool _isChecked = false;
  final TextEditingController name=TextEditingController();
  final TextEditingController decs=TextEditingController();
  final TextEditingController nameDontion=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController address=TextEditingController();




  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      page.animateToPage(++pageIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                            cubit.changeImage(picked.path);
                                          }
                                        },
                                        gallery: ()async{
                                          Navigator.pop(context);
                                          XFile? picked=await ImagePicker().pickImage(source: ImageSource.gallery,maxHeight: 1080,maxWidth: 1080);
                                          if(picked !=null){
                                            cubit.changeImage(picked.path);
                                          }
                                        });
                                  });
                            },
                            child: (cubit.file==null)?
                            Container(
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
                            ):Container(
                              width: 330,
                              height: 100,
                              color: Constant.grayColor,
                              child: Image.file(cubit.file!,fit: BoxFit.cover,)
                            ),
                          ),
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
                                    child: Text(e.name??''),
                                  );
                                }),
                              ],
                              value: valCategory,
                              onChanged: (String? val){
                                if(val!=null){
                                  if(valCategory=='e'){
                                    valCategory='-1';
                                  }else{
                                    valCategory=val.toString();
                                  }
                                }
                              },
                              decoration:InputDecoration(
                                label:Text(LocaleKeys.category.tr()),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Constant.blackColor,
                                    )
                                ),

                              )
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
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
                          DropdownButton(
                              value: dropdownvalue,
                              underline: Container(),
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
                                  dropdownvalue = newValue!;
                                });
                              },
                              alignment: Alignment.centerLeft),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: const [
                              Text(
                                "وصف الغرض",
                                style: AppStyles.s18,
                              ),
                              Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            maxLength: 6,
                            controller: decs,
                            decoration: InputDecoration(
                              hintText: 'مثال قميص ازرق مقاس xl مصنوع من خامه...',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Constant.grayColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Please enter your first name';
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          InkWell(
                            onTap: (){
                              _nextPage();

                            },
                            child: Container(
                              width: 300.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Constant.greenColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
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
                          Image.asset('assets/images/pp.png'),
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
                          DropdownButton(
                              value: contactType,
                              underline: Container(),
                              icon: null,
                              isExpanded: true,
                              items: contactTypeList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if(newValue=='هاتف'){
                                  contact=0;
                                }else{
                                  contact=1;
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
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: phone,
                            validator: (value) {
                              if (value!.isEmpty){
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
                              const Text(
                                "*",
                                style: AppStyles.s14r,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty){
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
                                        isExpanded: true,
                                        items:  [
                                          DropdownMenuItem(
                                            value: 'e',
                                            child: Text(LocaleKeys.didNotSpecify.tr()),
                                          ),
                                          ...cubit.countriesList.map((e){
                                            return DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(e.name??'',softWrap: true,overflow: TextOverflow.ellipsis),
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
                                        decoration:InputDecoration(
                                          label:  Text(LocaleKeys.countries.tr()),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Constant.blackColor,
                                              )
                                          ),

                                        )
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
                                              child: Text(e.name??''),
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
                                          label:  Text(LocaleKeys.cities.tr()),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Constant.blackColor,
                                              )
                                          ),

                                        )
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
                          Center(child: CircularProgressIndicator(),):InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.uploadDonation(
                                    description: decs.text,
                                    name: nameDontion.text,
                                    email: email.text,
                                    address: address.text,
                                    cityId: int.parse(valCities!),
                                    categoryId:int.parse(valCategory!),
                                    title: name.text,
                                    contactType: contact,
                                    mobile: phone.text,
                                    showName: showName,
                                    validFor: dropdownvalue!
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
        if(state.msg=='Please verify your contact'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Container()));
        }else{
          BlocProvider.of<AppCubit>(context).changeIndex(0);
        }

      }
    });
  }
}

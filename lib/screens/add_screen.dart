import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haba/constant.dart';
import 'package:haba/shared/defult_text.dart';
import 'package:haba/translations/locale_keys.g.dart';

class FormPageView extends StatefulWidget {
  @override
   _FormPageViewState createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int pageIndex = 0;
  PageController page = PageController(initialPage: 0);

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  bool _isChecked = false;

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      page.animateToPage(++pageIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: PageView(
              pageSnapping: true,
              controller: page,
              scrollDirection: Axis.horizontal,
              children: [
                _buildLastNameStep(),
                _buildFirstNameStep(),
              ])),
    );
  }

  Widget _buildFirstNameStep() {
    return Padding(
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
              children:  [
                Text(LocaleKeys.nameDonor.tr(),
                  style: AppStyles.s18,
                ),
                const Text(
                  "*",
                  style: AppStyles.s14r,
                ),
              ],
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) return LocaleKeys.pleaseEnterYourFirstName.tr();
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.exampleBlueShirt.tr(),
                border: InputBorder.none,
                filled: true,
                fillColor: Constant.grayColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
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
              children:  [
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
              height: AppSize.s36,
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
              validator: (value) {
                if (value!.isEmpty) return LocaleKeys.pleaseEnterYourPhone.tr();
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.phone.tr(),
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
              validator: (value) {
                if (value!.isEmpty) return LocaleKeys.pleaseEnterYourEmail.tr();
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.email.tr(),
                border: InputBorder.none,
                filled: true,
                fillColor: Constant.grayColor,
                contentPadding:
                   const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              validator: (value) {
                if (value!.isEmpty) return LocaleKeys.pleaseEnterYourAddress.tr();
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.buildingNumber.tr(),
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
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {

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
                  LocaleKeys.submit.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 17.0),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastNameStep() {
    return Padding(
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
              onTap: (){},
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
              validator: (value) {
                if (value!.isEmpty) return LocaleKeys.pleaseEnterYourName.tr();
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.exampleBlueShirt.tr(),
                border: InputBorder.none,
                filled: true,
                fillColor: Constant.grayColor,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              decoration: InputDecoration(
                hintText: 'مثال قميص ازرق مقاس xl مصنوع من خامه...',
                border: InputBorder.none,
                filled: true,
                fillColor: Constant.grayColor,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please enter your first name';
                return null;
              },
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            InkWell(
              onTap: _nextPage,
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
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

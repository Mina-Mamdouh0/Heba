import 'dart:core';

import 'package:flutter/material.dart';
import 'package:haba/constant.dart';
import 'package:haba/shared/defult_text.dart';

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
          duration: Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PageView(
                pageSnapping: true,
                controller: page,
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLastNameStep(),
                  _buildFirstNameStep(),
                ]),
          )),
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
              children: const [
                Text(
                  "اسم المتبرع",
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
                  hintText: 'مثال قميص ازرق',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Constant.grayColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
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
                Text("لا اريد عرض الاسم")
              ],
            ),
            const SizedBox(
              height: AppSize.s36,
            ),
            Row(
              children: const [
                Text(
                  "طريقة التواصل",
                  style: AppStyles.s18,
                ),
                Text(
                  "*",
                  style: AppStyles.s14r,
                ),
              ],
            ),
            Container(
              width: 330,
              height: 45,
              color: Constant.grayColor,
              child: DropdownButton(
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
            ),
            const SizedBox(
              height: AppSize.s36,
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
                  hintText: 'مثال قميص ازرق',
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
                  hintText: 'مثال قميص ازرق',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "البلد",
                          style: AppStyles.s18,
                        ),
                        Text(
                          "*",
                          style: AppStyles.s14r,
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 45,
                      color: Constant.grayColor,
                      child: DropdownButton(
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
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "المدينة",
                          style: AppStyles.s18,
                        ),
                        Text(
                          "*",
                          style: AppStyles.s14r,
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 45,
                      color: Constant.grayColor,
                      child: DropdownButton(
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
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            Row(
              children: const [
                Text(
                  "العنوان",
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
                  hintText: 'رقم البناء-اسم الشارع',
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
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted')),
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
                child: const Center(
                    child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
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
              children: const [
                Text(
                  "صورة الغرض",
                  style: AppStyles.s18,
                ),
                Text(
                  "*",
                  style: AppStyles.s14r,
                ),
              ],
            ),
            Container(
              width: 330,
              height: 100,
              color: Constant.grayColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "اضف صورة",
                    style: AppStyles.s24,
                  ),
                  SizedBox(
                    width: AppSize.s25,
                  ),
                  Icon(
                    Icons.add_a_photo,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            Row(
              children: const [
                Text(
                  "اسم الغرض",
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
                  hintText: 'مثال قميص ازرق',
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
                  "القسم",
                  style: AppStyles.s18,
                ),
                Text(
                  "*",
                  style: AppStyles.s14r,
                ),
              ],
            ),
            Container(
              width: 330,
              height: 45,
              color: Constant.grayColor,
              child: DropdownButton(
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
            ),
            const SizedBox(
              height: AppSize.s15,
            ),
            Row(
              children: const [
                Text(
                  "متاح لغاية",
                  style: AppStyles.s18,
                ),
                Text(
                  "*",
                  style: AppStyles.s14r,
                ),
              ],
            ),
            Container(
              width: 330,
              height: 45,
              color: Constant.grayColor,
              child: DropdownButton(
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
            ),
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
            Container(
              width: 330,
              height: 170,
              color: Constant.grayColor,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'مثال قميص ازرق مقاس xl مصنوع من خامه...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Constant.grayColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter your first name';
                  return null;
                },
              ),
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
//jlkj
          ],
        ),
      ),
    );
  }
}

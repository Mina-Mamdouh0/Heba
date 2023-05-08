
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/avaliable_form.dart';
import 'package:haba/translations/locale_keys.g.dart';

class DrawerWidget2 extends StatefulWidget {
   DrawerWidget2({Key? key}) : super(key: key);

  @override
  State<DrawerWidget2> createState() => _DrawerWidget2State();
}

class _DrawerWidget2State extends State<DrawerWidget2> {
  String? valCategory;
  String? valCountries;
  String? valCities;

  final TextEditingController search=TextEditingController();

  @override
  void initState() {
    if(BlocProvider.of<AppCubit>(context).countriesList.isEmpty){
      BlocProvider.of<AppCubit>(context).getCountries();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 10.0,
      width: MediaQuery.of(context).size.width*0.75,
      child: BlocConsumer<AppCubit,AppState>(
        builder: (context, state){
          var cubit=AppCubit.get(context);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: LocaleKeys.search.tr(),
                    prefixIcon: Icon(Icons.search,color: Constant.greenColor),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Constant.blackColor,
                        )
                    ),

                  ),
                ),
                const SizedBox(height: 10,),

                (state is LoadingGetCategory)?
                const Center(child: CircularProgressIndicator(),):
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
                const SizedBox(height: 10,),

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

                (state is LoadingGetItemHome)?
                const Center(child: CircularProgressIndicator(),):
                InkWell(
                  onTap: () {
                    cubit.getDateHome(cityId: valCities??'-1', categoryId: valCategory??'-1',
                        countryId: valCountries??'-1',
                        search: search.text.isNotEmpty?search.text:null);
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
          );
        },
        listener: (context, state){
          if(state is SuccessGetItemHome){
            if(search.text.isNotEmpty){
              if(state.lendth!=0){
                Navigator.of(context).pop();
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AvailableFormScreen()));
              }
              }else{
              Navigator.of(context).pop();
            }


          }

        },
      )
    );
  }
}



import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/model/contact_model.dart';
import 'package:haba/model/item_model.dart';
import 'package:haba/model/our_vision_model.dart';
import 'package:haba/model/show_donate_form_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void changeLunApp({required BuildContext context,required String lun}){
    context.setLocale( Locale(lun));
    emit(ChangeLunApp());
  }

  File? file;
  void changeImage(String imagePath){
    file=File(imagePath);
    if(file!=null){
      emit(ChangeImageState());
    }
  }

  //get data in home
  List<ItemModel> itemList=[];
  void getDateHome({required String cityId,required String categoryId,required String countryId ,String? search})async{
    itemList=[];
  emit(LoadingGetItemHome());

  SharedPreferences pref=await SharedPreferences.getInstance();
  String lun=pref.getString('Lung')??'';
   await Services.get(uri: Uri.parse('${Constant.baseUrl}/api?${search==null?'search=':'search=$search'}&country_id=$countryId&city_id=$cityId&category_id=$categoryId'),
      headers: {
    'Accept':'application/json',
    'Content-Type':'application/json',
    'X-localization':lun,
  }).then((value){
     for(int i=0; i < value['items'].length; i++){
       itemList.add(ItemModel.jsonData(value['items'][i]));
     }
     print('done');
     emit(SuccessGetItemHome(1));
  }).onError((error, stackTrace){
    print(error.toString());
    emit(ErrorGetItemHome());
  });
}

  List<CategoryModel> categoryList=[];
  void getCategories()async{
    categoryList=[];
    emit(LoadingGetCategory());

    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/categories'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
      for(int i=0; i < value['categories'].length; i++){
        categoryList.add(CategoryModel.jsonData(value['categories'][i]));
      }
      emit(SuccessGetCategory());
    }).onError((error, stackTrace){
      print(error.toString());
      emit(ErrorGetCategory());
    });
  }

  List<CountriesModel> countriesList=[];
  void getCountries()async{
    countriesList=[];
    emit(LoadingGetCountries());

    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/countries'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
      for(int i=0; i < value['countries'].length; i++){
        countriesList.add(CountriesModel.jsonData(value['countries'][i]));
      }
      emit(SuccessGetCountries());
    }).onError((error, stackTrace){
      print(error.toString());
      emit(ErrorGetCountries());
    });
  }

  List<CitiesModel> citiesList=[];
  void getCities({required String countryID})async{
    citiesList=[];
    emit(LoadingGetCities());

    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/cities?country_id=$countryID'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
      for(int i=0; i < value['cities'].length; i++){
        citiesList.add(CitiesModel.jsonData(value['cities'][i]));
      }
      emit(SuccessGetCities());
    }).onError((error, stackTrace){
      print(error.toString());
      emit(ErrorGetCities());
    });
  }






  ContactModel contactModel=ContactModel();
  void getContactUs()async{
    emit(LoadingGetContactUs());
    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung')??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/contact'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
          print(value);
          contactModel=ContactModel.jsonData(value['contact']);
      emit(SuccessGetContactUs());
    }).onError((error, stackTrace){
      print(error.toString());
      emit(ErrorGetContactUs());
    });
  }

  OurVisionModel ourVisionModel=OurVisionModel();
  void getOurVision()async{
    emit(LoadingGetOurVision());
    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung')??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/page/our-vision'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
      ourVisionModel=OurVisionModel.jsonData(value['page']);
      emit(SuccessGetOurVision());
    }).onError((error, stackTrace){
      print(error.toString());
      emit(ErrorGetOurVision());
    });
  }

  void uploadDonation({required String name,required int showName ,
  required int contactType,required String mobile,required String email,
  required int categoryId,required int cityId,required String address,
  required String title,required String description,required String validFor}){


    var request = http.MultipartRequest('POST', Uri.parse('${Constant.baseUrl}/api/page/our-vision'));
    request.files.add(http.MultipartFile.fromBytes('files', File(file!.path).readAsBytesSync(),filename: file!.path));

    request.fields['donor_name'] = name;
    request.fields['show_name'] = showName.toString();
    request.fields['contact_type'] = contactType.toString();
    request.fields['mobile'] = mobile;
    request.fields['email'] = email;
    request.fields['email'] = email;
    request.fields['category_id'] = categoryId.toString();
    request.fields['city_id'] = cityId.toString();
    request.fields['address'] = address;
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['valid_for'] = validFor.toString();
  }


}

class Services{
  static Future<dynamic> get({required Uri uri,Map<String,dynamic>? queryParams,
    Map<String,String>? headers})async{
    http.Response response=await http.get(uri.replace(
        queryParameters: queryParams
    ),headers:headers );
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('statusCode = ${response.statusCode}');
    }
  }
}


import 'dart:convert';
import 'dart:io';
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
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void changeLunApp({required BuildContext context,required String lun}){
    context.setLocale( Locale(lun));
    emit(ChangeLunApp());
  }

  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

 /* uploadListImage(List<File> images)async{
    ImagePicker picker = ImagePicker()            ;
    List<XFile>? xFileImages                      ;
    xFileImages = await picker.pickMultiImage(imageQuality:80 )   ;
    var needImageSizeMessage = false   ;
    for (XFile xFile in xFileImages) {

      if(File(xFile.path).lengthSync() <AppConstant.sizeImage5MB){  //ensure the size of picture is less than 5 Mb
        images.add(File(xFile.path))                ;
      }else{
        needImageSizeMessage = true*/



  List<File> fileList=[];
  void changeListImage(String file){
    fileList.add(File(file));
    emit(ChangeImageState());
  }

  void deleteImageOfferDetails(int index){
    fileList.removeAt(index);
    emit(ChangeImageState());
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
     emit(SuccessGetItemHome(value['items'].length));
  }).onError((error, stackTrace){
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
      emit(ErrorGetCategory());
    });
  }

  List<CategoryModel> subCategoryList=[];
  void getSubCategories({required String subCategoryIndex})async{
    subCategoryList=[];
    emit(LoadingGetSubCategory());

    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';

    await Services.get(uri: Uri.parse('${Constant.baseUrl}/api/category/get_children/$subCategoryIndex'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        }).then((value){
          print(value.toString());
      for(int i=0; i < value['children'].length; i++){
        subCategoryList.add(CategoryModel.jsonData(value['children'][i]));
      }
      emit(SuccessGetSubCategory());
    }).onError((error, stackTrace){
      emit(ErrorGetSubCategory());
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
      emit(ErrorGetCities());
    });
  }

  void uploadForm({required String name,required String phone,
  required String email,required String msg,required String subject})async{

    emit(LoadingFormSearch());
    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';
    await Services.post(uri: Uri.parse('https://hibadonations.com/api/contact/submit'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        },
    queryParams: {
      'name':name,
      'mobile':phone,
      'email':email,
      'subject':subject,
      'msg':msg,
    }).then((value){

      emit(SuccessFormSearch());
    }).onError((error, stackTrace){
      emit(ErrorFormSearch());
    });
  }

  void avabileForm({required String name,required String phone,required String country,required String city,
    required String email,required String category,required String query})async{

    emit(LoadingFormNotSearch());
    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';
    await Services.post(uri: Uri.parse('https://hibadonations.com/api/inform'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        },
        queryParams: {
          'name':name,
          'mobile':phone,
          'email':email,
          'query':query,
          'category_id':category,
          'country_id':country,
          'city_id':city,
        }).then((value){

      emit(SuccessFormNotSearch());
    }).onError((error, stackTrace){
      emit(ErrorFormNotSearch());
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
          contactModel=ContactModel.jsonData(value['contact']);
      emit(SuccessGetContactUs());
    }).onError((error, stackTrace){
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
      emit(ErrorGetOurVision());
    });
  }

  void uploadDonation({required String name,required int showName ,
  required int contactType,required String mobile,required String email,
  required int categoryId,required int cityId,required String address,
  required String title,required String description,required String validFor})async{

    emit(LoadingFormDontion());
    var request = http.MultipartRequest('POST', Uri.parse('https://hibadonations.com/api/donate/new'));
    for(var n in fileList){
      request.files.add(http.MultipartFile.fromBytes('files', File(n.path).readAsBytesSync(),filename: n.path));

    }

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

    var res = await request.send();
    var resed = await http.Response.fromStream(res);
    var resData = json.decode(resed.body);

    print(resData.toString());

    if(res.statusCode==200){
      emit(SuccessFormDontion(resData['message'].toString(),
          resData['item']['user_id'].toString()));
    }else{
      emit(ErrorFormDontion());
    }
  }

  void verifyOTP({required String uuid,required String code})async{
    emit(LoadingOtp());
    SharedPreferences pref=await SharedPreferences.getInstance();
    String lun=pref.getString('Lung',)??'';
    await Services.post(uri: Uri.parse('https://hibadonations.com/api/verify'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'X-localization':lun,
        },
        queryParams: {
          'user_id':uuid,
          'otp':code,
        }).then((value){
      emit(SuccessOtp());

    }).onError((error, stackTrace){
      print('eee');
      emit(ErrorOtp());
    });
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

  static Future<dynamic> post({required Uri uri,Map<String,dynamic>? queryParams,
    Map<String,String>? headers})async{

    http.Response response=await http.post(uri.replace(
        queryParameters: queryParams
    ),headers:headers );
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('statusCode = ${response.statusCode}');
    }
  }
}
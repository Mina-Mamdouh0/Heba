import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/screens/spalsh_screen.dart';
import 'package:haba/translations/codegen_loader.g.dart';

void main() {
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales:const  [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child:BlocProvider(
        create:(_)=>AppCubit()..getDateHome(categoryId: '-1',countryId: '-1',cityId: '-1')..getCategories(),
        child: const MyApp(),)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Haba',
      home: const SplashScreen(),
    );
  }
}


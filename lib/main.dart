import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/views/login/pages/login_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    GetMaterialApp(
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          secondaryHeaderColor: const Color(0xff62C185), 
          primaryColor: const Color(0xff62C185), 
          hintColor: const Color(0xff62C185),
          focusColor: const Color(0xff62C185),
          hoverColor: const Color(0xff62C185),
          indicatorColor: const Color(0xff62C185),
          highlightColor: const Color(0xff62C185),
          ),
));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
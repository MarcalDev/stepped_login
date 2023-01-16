import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/register_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';

void main() => runApp(
    MaterialApp(
        home: step_register_page(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          secondaryHeaderColor: const Color(0xff62C185), 
          primaryColor: const Color(0xff62C185), 
          hintColor: const Color(0xff62C185),
          focusColor: const Color(0xff62C185),
          hoverColor: const Color(0xff62C185),
          indicatorColor: const Color(0xff62C185),
          ),
));
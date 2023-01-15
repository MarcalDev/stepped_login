import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/register_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';

void main() => runApp(
    MaterialApp(
        home: step_register_page(),
        debugShowCheckedModeBanner: false,
));
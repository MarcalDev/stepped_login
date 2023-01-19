import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/profile_pic_partial.dart';
class register_controller{
  String? _email;
  setEmail(String value) => _email = value;

  String? _name;
  setName(String value) => _name = value;

  String? _phoneArea;
  setPhoneArea(String value) => _phoneArea = value;

  String? _phoneNumber;
  setPhoneNumber(String value) => _phoneNumber = value;

  String? _password;
  setPassword(String value) => _password = value;

  String? _second_password;
  setSecondPassword(String value) => _second_password = value;

  TextEditingController email_controller = TextEditingController();

  TextEditingController name_controller = TextEditingController();

  TextEditingController phone_area_controller = TextEditingController();

  TextEditingController phone_number_controller = TextEditingController();

  TextEditingController password_controller = TextEditingController();
  
  TextEditingController second_password_controller = TextEditingController();

  basic_data_partial firstPage = basic_data_partial();
  password_partial secondPage = password_partial();
  profile_pic_partial thirdPage = profile_pic_partial();

  
}
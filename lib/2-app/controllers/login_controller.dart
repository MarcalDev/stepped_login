import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';

class LoginController extends GetxController{
  late BuildContext context;
  late TextEditingController email_controller;
  late TextEditingController password_controller;
  late RxBool saveUserLogin;

  LoginController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    email_controller = TextEditingController();
    password_controller = TextEditingController();
    saveUserLogin = false.obs;
  }

  PushToRegisterPage(){
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => StepRegisterPage()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => StepRegisterPage()));
    Get.to(StepRegisterPage());  
  }
}
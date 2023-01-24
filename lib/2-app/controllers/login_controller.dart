import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/views/home/home_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';
import 'package:uuid/uuid.dart';
import '../views/popups/error_popup.dart';

class LoginController extends GetxController{
  late BuildContext context;
  late TextEditingController email_controller;
  late TextEditingController password_controller;
  late RxBool saveUserLogin;
  late UserService userService;

  LoginController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    email_controller = TextEditingController();
    password_controller = TextEditingController();
    saveUserLogin = false.obs;
    userService = UserService();
  }

  PushToRegisterPage(){
    email_controller.clear();
    password_controller.clear();
    Get.to(StepRegisterPage());  
  }


  loginUser() async{
    if(email_controller.text.isNotEmpty && password_controller.text.isNotEmpty){
      LoadingIndicatorDialog().show(context);
      var result = await userService.userAuthentication(email_controller.text, password_controller.text);
      LoadingIndicatorDialog().dismiss();
      if(result != null){
        Get.to(() => HomePage(user: result));  
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Usuário ou Senha incorreto(s)");});
      }
    }else{
      showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos");});
    }
  }
}
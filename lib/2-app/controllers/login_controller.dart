import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/views/home/home_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';
import '../views/popups/error_popup.dart';

class LoginController extends GetxController{
  late BuildContext context;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late RxBool saveUserLogin;
  late UserService userService;

  LoginController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    saveUserLogin = false.obs;
    userService = UserService();
  }

  pushToRegisterPage(){
    emailController.clear();
    passwordController.clear();
    Get.to(const StepRegisterPage());  
  }


  loginUser() async{
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      LoadingIndicatorDialog().show(context);
      var result = await userService.userAuthentication(emailController.text, passwordController.text);
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
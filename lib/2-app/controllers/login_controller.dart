import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/repositorys/user_repository.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/helpers/app_enums.dart';
import 'package:stepped_login/2-app/helpers/email_sender/email.dart';
import 'package:stepped_login/2-app/views/home/home_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';
import '../helpers/email_sender/sender_user_data.dart';
import '../views/popups/error_popup.dart';

import 'base_controller.dart';

class LoginController extends GetxController with BaseController{
  late BuildContext context;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late RxBool saveUserLogin;
  late UserService userService;
  late UserRepository userRepository;
  late RxList<String> emailRequirementsList;
  late RxList<String> passwordRequirementsList;
  late String generatedCode;

  LoginController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    saveUserLogin = false.obs;
    userService = UserService();
    userRepository = UserRepository();
    emailRequirementsList = List<String>.empty().obs;
    passwordRequirementsList = List<String>.empty().obs;
    generatedCode = "";
    getSavedUser();
  }

  pushToRegisterPage(){
    emailController.clear();
    passwordController.clear();
    emailRequirementsList.value.clear();
    passwordRequirementsList.value.clear();
    Get.to(const StepRegisterPage(), transition: Transition.noTransition);  
  }

  loginUser() async{
    _sendEmail();
    // try{
    //   emailRequirementsList.value.clear();
    //   passwordRequirementsList.value.clear();

    //   if(emailController.text.isEmpty){
    //     emailRequirementsList.add("Insira seu e-mail");
    //   }
    //   if(passwordController.text.isEmpty){
    //     passwordRequirementsList.add("Insira sua senha");
    //   }
      
    //   if(emailRequirementsList.isEmpty && passwordRequirementsList.isEmpty)
    //   {
    //     LoadingIndicatorDialog().show(context);
    //     if(await checkConnectivity()){          
    //       await openPopup(PopupTypeEnum.error, "Verifique sua conexão à internet");  
    //       LoadingIndicatorDialog().dismiss();    
    //     }else{        
    //       var result = await userService.userAuthentication(emailController.text, passwordController.text);        
    //       LoadingIndicatorDialog().dismiss();  
    //       if(result != null){
    //         if(saveUserLogin.value){
    //           var insertUser = await userRepository.insertOrReplaceUser(result);
    //         }         
    //         Get.to(() => HomePage(user: result));  
    //       }else{
    //         openPopup(PopupTypeEnum.error, "Usuário e/ou Senha incorreto(s)");
    //       }  
    //     }
    //   }
    // } catch(ex){   
    //   openPopup(PopupTypeEnum.error, "ERRO");   
    //   }
  }

  getSavedUser() async{
    User? savedUser = await userRepository.getUser();
    if(savedUser!=null)
    {
      emailController.text = savedUser.email!;
      passwordController.text = savedUser.password!;
      saveUserLogin.value = true;
    }
  }

  
  void _sendEmail() async{
    var email = Email(SenderUserData.username, SenderUserData.password);
    
    var rng = Random();
    generatedCode = "";
    for(var i=0; i<4;i++){
      generatedCode += rng.nextInt(9).toString();
    }
    
    openEmailPopup(emailController.value.text, generatedCode);
    //bool result = await email.sendMessage('Código de verificação: $generatedCode', emailController.value.text, 'Verificação de conta');
  }
}
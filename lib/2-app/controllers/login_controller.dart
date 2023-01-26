import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/repositorys/user_repository.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/views/home/home_page.dart';
import 'package:stepped_login/2-app/views/user_register/pages/step_register_page.dart';
import '../views/popups/error_popup.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginController extends GetxController{
  late BuildContext context;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late RxBool saveUserLogin;
  late UserService userService;
  late UserRepository userRepository;

  LoginController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    saveUserLogin = false.obs;
    userService = UserService();
    userRepository = UserRepository();
    getSavedUser();
  }

  // @override
  // void initState(){
  //   SystemChrome.setEnabledSystemUIMode([]);
  //   super.initState();
  // }

  pushToRegisterPage(){
    emailController.clear();
    passwordController.clear();
    Get.to(const StepRegisterPage());  
  }

  // _providerInternet<Widget>(){
  //   return StreamProvider<InternetConnectionStatus>(
  //   initialData: InternetConnectionStatus.connected,
  //   create: (_){
  //     return InternetConnectionChecker().onStatusChange;
  //   },
  // );
  // }


  loginUser() async{
    try{
      if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
        LoadingIndicatorDialog().show(context);
        var connection = await Connectivity().checkConnectivity();
        if(connection == ConnectivityResult.none){          
          await showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique sua conexão à internet");});  
          LoadingIndicatorDialog().dismiss();    
        }else{        
          var result = await userService.userAuthentication(emailController.text, passwordController.text);        
          LoadingIndicatorDialog().dismiss();  
          if(result != null){
            if(saveUserLogin.value){
              var insertUser = await userRepository.insertOrReplaceUser(result);
            }         
            Get.to(() => HomePage(user: result));  
          }else{
            showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Usuário e/ou Senha incorreto(s)");});
          }  
        }
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos");});
      }
    } catch(ex){   
      showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "ERRO");});   
      }
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
}
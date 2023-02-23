import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/helpers/app_enums.dart';
import 'package:stepped_login/2-app/helpers/app_permissions.dart';
import 'package:stepped_login/2-app/helpers/app_validations.dart';
import 'package:stepped_login/2-app/views/popups/error_popup.dart';
import 'package:stepped_login/2-app/views/popups/verify_email_popup.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/profile_pic_partial.dart';
import 'package:uuid/uuid.dart';
import '../helpers/email_sender/email.dart';
import '../helpers/email_sender/sender_user_data.dart';
import 'base_controller.dart';
class RegisterController extends GetxController with BaseController{

  late BuildContext context;
  late TextEditingController emailController;
  late String nameText;
  late TextEditingController nameController;
  late TextEditingController phoneAreaController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController secondPasswordController;
  late RxString profilePicturePath;
  late RxBool showPicture;
  late BasicDataPartial firstPage;
  late PasswordPartial secondPage;
  late ProfilePicPartial thirdPage;
  late UserService userService;
  late RxInt partialIndex;
  late RxDouble progressValue;
  late RxBool showStepIcon;
  late RxString actualStepIcon;
  late PageController pageController;
  late RxBool showNameError;
  late RxBool showEmailError;
  late RxBool showPasswordError;
  late RxBool showSecondPasswordError;
  late RxList<String> passwordRequirementsList;
  late RxList<String> secondPasswordRequirementsList;
  late RxList<String> nameRequirementsList;
  late RxList<String> emailRequirementsList;
  late String generatedCode;

  RegisterController({required this.context}){
    _initializeVariables();
    _addListeners();
  }

  _initializeVariables(){
    emailController = TextEditingController();
    nameText = "";
    nameController = TextEditingController();
    phoneAreaController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    secondPasswordController = TextEditingController();
    profilePicturePath = "".obs;
    showPicture = false.obs;
    firstPage = const BasicDataPartial();
    secondPage = const PasswordPartial();
    thirdPage = const ProfilePicPartial();
    userService = UserService();
    partialIndex = 0.obs;
    progressValue = 0.0.obs;
    showStepIcon = true.obs;
    actualStepIcon = "images/clipboard_image.png".obs;
    pageController = PageController();    
    passwordRequirementsList = List<String>.empty().obs;
    secondPasswordRequirementsList = List<String>.empty().obs;
    nameRequirementsList = List<String>.empty().obs;
    emailRequirementsList = List<String>.empty().obs;
    generatedCode = "";
  }

  _addListeners(){
    emailController.addListener(() async{
      if(emailController.text !=null && emailController.text != ""){        
        emailRequirementsList.clear();
        emailRequirementsList.value = AppValidations.validateEmailTextInput(emailController);
        if(emailRequirementsList.value.isEmpty){
          var result = await userService.checkAlredyUsedEmail(emailController.text);
          if(result){
            emailRequirementsList.add("Este e-mail já está em uso");
          }
        }
      }
    });

    nameController.addListener(() {
      if(nameController.text != nameText){
        nameText = nameController.text;
        nameRequirementsList.clear();
        nameRequirementsList.value = AppValidations.validateTextInput(nameController);
      }      
    });

    passwordController.addListener(() {
      if(passwordController.text !=null && passwordController.text != ""){        
        validatePassword();
      }
    });

    secondPasswordController.addListener(() {
      if(secondPasswordController.text !=null && secondPasswordController.text != ""){        
        validatePassword();
      }
    });
  }

  // Open camera/gallery
  Future takePicture(bool openCamera) async{
    PickedFile? selectedFile; 
    if(openCamera){
      if(await AppPermissions.getCameraPermission() == PermissionStatus.granted){
        selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
      }else{
        await openPopup(PopupTypeEnum.error, "Autorize o uso da câmera para tirar fotos"); 
      }

    }else{
      if(await AppPermissions.getStoragePermission() == PermissionStatus.granted){
        selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      }else{
        await openPopup(PopupTypeEnum.error, "Autorize o uso da galeria para importar fotos"); 
      }      
    }
      profilePicturePath.value = selectedFile!.path;
      showPicture.value = true;
      
      update();
  }
  
  // Insert of user in api Database
  postUser() async{
    const uui = Uuid();
    User user = User(
      id: uui.v1(),
      email: emailController.text,
      name: nameController.text,
      isActive: true,
      password: passwordController.text,
      phoneNumber: phoneAreaController.text + phoneNumberController.text,
      realeaseDate: null
    );
    
    LoadingIndicatorDialog().show(context);

    if(await checkConnectivity()){
      await openPopup(PopupTypeEnum.error,"Verifique sua conexão à internet");  
      LoadingIndicatorDialog().dismiss();    
    }else{
      var result = await userService.postUser(user);
      LoadingIndicatorDialog().dismiss();
      if(result){
        openPopup(PopupTypeEnum.success,"Usuário cadastrado com sucesso!")
        .then((_) => Navigator.of(context).popUntil((route) => route.isFirst));
        
      }else{
        openPopup(PopupTypeEnum.error,"Não foi possível cadastrar o usuário");
      }   
    }    
  }

  insertUser() async{
    if(emailController.text.isNotEmpty && nameController.text.isNotEmpty && passwordController.text.isNotEmpty && secondPasswordController.text.isNotEmpty){
      postUser();       
    }
    else{
      showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos",);});
    }     
  }  

  // Check if it is able to move to previous page
  checkBackPage(){       
      partialIndex.value = partialIndex.value - 1;
      progressValue.value -= 0.33;   
      showStepIcon.value = (partialIndex.value <= 1) ? true : false;
      actualStepIcon.value = (partialIndex.value < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
      pageController.jumpToPage(partialIndex.value);
  }

// Check if it is able to move to next page
  checkNextPage() async{
    if(partialIndex.value == 0){
      emailRequirementsList.value = AppValidations.validateEmailTextInput(emailController);
      nameRequirementsList.value = AppValidations.validateTextInput(nameController);

      if(emailRequirementsList.isEmpty && nameRequirementsList.isEmpty) {
         var result = await userService.checkAlredyUsedEmail(emailController.text);
          if(result){
            emailRequirementsList.add("Este e-mail já está em uso");
          }else{
            var checkEmail = await _sendEmail();
            if(checkEmail==true){
              nextPage();
            }else{
            }
            
          }        
      } 
    }else{        
        if(validatePassword()){
          nextPage();
        }         
    }
  }

  // INPUT VALIDATORS
  bool validatePassword(){
    passwordRequirementsList.clear(); 
    secondPasswordRequirementsList.clear();     
    
    var validPassword = true;
    var specialCaracters = ['@', '.', '-', '_','#'];
    
    if(passwordController.text.isEmpty){  
      passwordRequirementsList.add('Obrigatório*'); 
    }
    if(secondPasswordController.text.isEmpty){
      secondPasswordRequirementsList.add('Obrigatório*'); 
    }
    if(passwordController.text.length < 8){
      passwordRequirementsList.add('A senha deve conter ao menos 8 caracteres');      
      validPassword = false;
    }
    if(!passwordController.text.contains(RegExp(r'[A-Z]'))){
      passwordRequirementsList.add('A senha deve conter ao menos 1 letra maiuscula');      
      validPassword = false;
    }
    if(!passwordController.text.contains(RegExp(r'[0-9]'))){
      passwordRequirementsList.add('A senha deve conter ao menos 1 número');      
      validPassword = false;
    }
    if(!passwordController.text.contains(RegExp(specialCaracters.toString()))){
      passwordRequirementsList.add('A senha deve conter ao menos 1 caracter especial');      
      validPassword = false;
    }
    if(validPassword){
      if(passwordController.text != secondPasswordController.text){
        secondPasswordRequirementsList.add('As senhas informadas devem ser iguais');
      }
    } 
    return validPassword;
  }

  nextPage(){
    partialIndex.value = partialIndex.value + 1;
    progressValue.value += 0.33; 
    showStepIcon.value = (partialIndex.value == 2) ? false : true;
    actualStepIcon.value = (partialIndex.value >= 1) ? "images/lock_image.png" : "images/clipboard_image.png";
    pageController.jumpToPage(partialIndex.value);
  }

  
  Future<dynamic> _sendEmail() async{
    var email = Email(SenderUserData.username, SenderUserData.password);
    
    var rng = Random();
    generatedCode = "";
    for(var i=0; i<4;i++){
      generatedCode += rng.nextInt(9).toString();
    }
    
    bool result = await email.sendMessage('Código de verificação: $generatedCode', emailController.value.text, 'Verificação de conta');
    if(result){

      var checkEmail = showDialog(context: context, builder: (BuildContext context) {return VerifyEmailPopup(Email:emailController.value.text, Code:generatedCode);});

      //var checkEmail = openEmailPopup(emailController.value.text, generatedCode);      
      return checkEmail;
    }

    return false;
   
  }
}
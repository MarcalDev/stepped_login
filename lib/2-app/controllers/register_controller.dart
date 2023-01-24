import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/views/login/pages/login_page.dart';
import 'package:stepped_login/2-app/views/popups/error_popup.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/profile_pic_partial.dart';
import 'package:uuid/uuid.dart';
class RegisterController extends GetxController{

  late BuildContext context;
  late TextEditingController email_controller;
  late TextEditingController name_controller;
  late TextEditingController phone_area_controller;
  late TextEditingController phone_number_controller;
  late TextEditingController password_controller;
  late TextEditingController second_password_controller;
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


  RegisterController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    email_controller = TextEditingController();
    name_controller = TextEditingController();
    phone_area_controller = TextEditingController();
    phone_number_controller = TextEditingController();
    password_controller = TextEditingController();
    second_password_controller = TextEditingController();
    profilePicturePath = "".obs;
    showPicture = false.obs;
    firstPage = BasicDataPartial();
    secondPage = PasswordPartial();
    thirdPage = ProfilePicPartial();
    userService = UserService();
    partialIndex = 0.obs;
    progressValue = 0.0.obs;
    showStepIcon = true.obs;
    actualStepIcon = "images/clipboard_image.png".obs;
    pageController = PageController();
  }

  Future TakePicture(bool OpenCamera) async{
    PickedFile? selectedFile; 
    if(OpenCamera){
      selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    }else{
      selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    }
      //setProfilePicture(File(selectedFile!.path));
      profilePicturePath.value = selectedFile!.path;
      showPicture.value = true;
      //setShowPicture(true);
      update();
  }

  postUser() async{
    const uui = Uuid();
    User user = User(
      id: uui.v1(),
      email: email_controller.text,
      name: name_controller.text,
      isActive: true,
      password: password_controller.text,
      phoneNumber: phone_area_controller.text + phone_number_controller.text,
      realeseDate: null
    );
    
    var result = await userService.postUser(user);
    if(result){
      print("USUARIO INSERIDO");
       Get.to(() => LoginPage());  
    }else{
      print("USUARIO NAO INSERIDO");
    }
  }

  insertUser() async{
    if(email_controller.text.isNotEmpty && name_controller.text.isNotEmpty && password_controller.text.isNotEmpty && second_password_controller.text.isNotEmpty){
      postUser(); 
    }
    else{
      showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos",);});
    }     
  }  

  checkBackPage(){   
    partialIndex.value = partialIndex.value - 1;
    progressValue.value -= 0.33;   
    showStepIcon.value = (partialIndex.value <= 1) ? true : false;
    actualStepIcon.value = (partialIndex.value < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
    pageController.jumpToPage(partialIndex.value);
  }

  checkNextPage(){
    if(partialIndex == 0){
      if(email_controller.text.isNotEmpty && name_controller.text.isNotEmpty){
        nextPage();
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos",);});
      }
    }else{
      if(password_controller.text.isNotEmpty && second_password_controller.text.isNotEmpty){
        if(password_controller.text != second_password_controller.text){
          showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "As senhas informadas devem ser iguais",);});
        }else{
          if(password_controller.text.length < 6){
            showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "A senha deve conter ao menos 6 caracteres",);});
          }else{
            nextPage();
          }
        }
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos",);});
      }
    }
  }

  nextPage(){
    partialIndex.value = partialIndex.value + 1;
    progressValue.value += 0.33; 
    showStepIcon.value = (partialIndex.value == 2) ? false : true;
    actualStepIcon.value = (partialIndex.value >= 1) ? "images/lock_image.png" : "images/clipboard_image.png";
    pageController.jumpToPage(partialIndex.value);
  }
  
}
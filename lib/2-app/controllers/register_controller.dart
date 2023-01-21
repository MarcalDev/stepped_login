import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/profile_pic_partial.dart';
class RegisterController extends GetxController{

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
  

  RegisterController(){
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
  
}
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/profile_pic_partial.dart';
class register_controller extends GetxController{

  late TextEditingController email_controller;
  late TextEditingController name_controller;
  late TextEditingController phone_area_controller;
  late TextEditingController phone_number_controller;
  late TextEditingController password_controller;
  late TextEditingController second_password_controller;
  late RxString profilePicturePath;
  late RxBool showPicture;
  late basic_data_partial firstPage;
  late password_partial secondPage;
  late profile_pic_partial thirdPage;
  

  register_controller(){
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
    firstPage = basic_data_partial();
    secondPage = password_partial();
    thirdPage = profile_pic_partial();
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
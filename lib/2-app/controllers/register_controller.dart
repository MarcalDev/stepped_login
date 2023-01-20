import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/profile_pic_partial.dart';
class register_controller extends GetxController{
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

  // bool? showPicture = false;
  // setShowPicture(bool value) => showPicture = value;

  File? profilePicture;
  setProfilePicture(File value) => (profilePicture = value).obs;

  // basic data
  TextEditingController email_controller = TextEditingController();

  TextEditingController name_controller = TextEditingController();

  TextEditingController phone_area_controller = TextEditingController();

  TextEditingController phone_number_controller = TextEditingController();

  // password
  TextEditingController password_controller = TextEditingController();

  TextEditingController second_password_controller = TextEditingController();

  // step partials
  basic_data_partial firstPage = basic_data_partial();
  password_partial secondPage = password_partial();
  profile_pic_partial thirdPage = profile_pic_partial();

  // profile picture
  late RxString profilePicturePath;
  late RxBool showPicture;

  register_controller(){
    _initializeVariables();
  }

  _initializeVariables(){
    profilePicturePath = "".obs;
    showPicture = false.obs;
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
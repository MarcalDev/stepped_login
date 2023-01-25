import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/1-base/services/user_service.dart';
import 'package:stepped_login/2-app/controllers/loading_indicator_dialog.dart';
import 'package:stepped_login/2-app/views/popups/error_popup.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/widgets/profile_pic_partial.dart';
import 'package:uuid/uuid.dart';
import '../views/popups/success_popup.dart';
class RegisterController extends GetxController{

  late BuildContext context;
  late TextEditingController emailController;
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


  RegisterController({required this.context}){
    _initializeVariables();
  }

  _initializeVariables(){
    emailController = TextEditingController();
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
  }

  Future takePicture(bool openCamera) async{
    PickedFile? selectedFile; 
    if(openCamera){
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
      email: emailController.text,
      name: nameController.text,
      isActive: true,
      password: passwordController.text,
      phoneNumber: phoneAreaController.text + phoneNumberController.text,
      realeseDate: null
    );
    
    LoadingIndicatorDialog().show(context);
    var result = await userService.postUser(user);
    LoadingIndicatorDialog().dismiss();
    if(result){
      showDialog(context: context, builder: (BuildContext context) {return SuccessPopup(popupText: "Usuário cadastrado com sucesso!",);})
      .then((_) => Navigator.of(context).popUntil((route) => route.isFirst));
       
    }else{
       showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Não foi possível cadastrar o usuário",);});
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

  checkBackPage(){       
      partialIndex.value = partialIndex.value - 1;
      progressValue.value -= 0.33;   
      showStepIcon.value = (partialIndex.value <= 1) ? true : false;
      actualStepIcon.value = (partialIndex.value < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
      pageController.jumpToPage(partialIndex.value);
  }

  checkNextPage(){
    if(partialIndex.value == 0){
      if(emailController.text.isNotEmpty && nameController.text.isNotEmpty){
        nextPage();
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique os campos não preenchidos",);});
      }
    }else{
      if(passwordController.text.isNotEmpty && secondPasswordController.text.isNotEmpty){
        if(passwordController.text != secondPasswordController.text){
          showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "As senhas informadas devem ser iguais",);});
        }else{
          if(passwordController.text.length < 6){
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
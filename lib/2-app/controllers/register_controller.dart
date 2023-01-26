import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
  late RxBool showNameError;
  late RxBool showEmailError;
  late RxBool showPasswordError;
  late RxBool showSecondPasswordError;
  late RxList<String> requirementsList;


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
    showNameError = false.obs;
    showEmailError = false.obs;
    showPasswordError = false.obs;
    showSecondPasswordError = false.obs;
    requirementsList = List<String>.empty().obs;
  }

  Future takePicture(bool openCamera) async{
    PickedFile? selectedFile; 
    if(openCamera){
      var cameraPermission = await Permission.camera.request();
      if(cameraPermission.isGranted){
        selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
      }else{
        await showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Autorize o uso da câmera para tirar fotos");}); 
      }
    }else{
      var galleryPermission = await Permission.storage.request();
      if(galleryPermission.isGranted){
        selectedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      }else{
        await showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Autorize o uso da galeria para importar fotos");}); 
      }      
    }
      //setProfilePicture(File(selectedFile!.path));
      profilePicturePath.value = selectedFile!.path;
      showPicture.value = true;
      //setShowPicture(true);
      update();
  }

  getPermissionStatus() async{
    await Permission.camera.request();

    return await Permission.camera.status;    
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
      realeaseDate: null
    );
    
    LoadingIndicatorDialog().show(context);
    var connection = await Connectivity().checkConnectivity();

    if(connection == ConnectivityResult.none){
      await showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Verifique sua conexão à internet");});  
      LoadingIndicatorDialog().dismiss();    
    }else{
      var result = await userService.postUser(user);
      LoadingIndicatorDialog().dismiss();
      if(result){
        showDialog(context: context, builder: (BuildContext context) {return SuccessPopup(popupText: "Usuário cadastrado com sucesso!",);})
        .then((_) => Navigator.of(context).popUntil((route) => route.isFirst));
        
      }else{
        showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "Não foi possível cadastrar o usuário",);});
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

  checkBackPage(){       
      partialIndex.value = partialIndex.value - 1;
      progressValue.value -= 0.33;   
      showStepIcon.value = (partialIndex.value <= 1) ? true : false;
      actualStepIcon.value = (partialIndex.value < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
      pageController.jumpToPage(partialIndex.value);
  }

  checkNextPage(){
    if(partialIndex.value == 0){
      showNameError.value = nameController.text.isEmpty;
      showEmailError.value = emailController.text.isEmpty;

      if(emailController.text.isNotEmpty && nameController.text.isNotEmpty){
        nextPage();
      }
    }else{
      showPasswordError.value = passwordController.text.isEmpty;
      showSecondPasswordError.value = secondPasswordController.text.isEmpty;
      if(passwordController.text.isNotEmpty && secondPasswordController.text.isNotEmpty){
        requirementsList.clear();
        if(passwordController.text != secondPasswordController.text){
          requirementsList.add('As senhas informadas devem ser iguais');
          //showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "As senhas informadas devem ser iguais",);});
        }else{
          if(passwordController.text.length < 6){
            requirementsList.add('A senha deve conter ao menos 6 caracteres');
            //showDialog(context: context, builder: (BuildContext context) {return ErrorPopup(popupText: "A senha deve conter ao menos 6 caracteres",);});
          }else{
            requirementsList.clear();
            nextPage();
          }
        }
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
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/popups/error_popup.dart';
import 'package:stepped_login/2-app/views/popups/two_options_popup.dart';

import '../helpers/app_enums.dart';
import '../views/popups/success_popup.dart';

class BaseController{
  late BuildContext context;

   openPopup(PopupTypeEnum popupType, String? popupText) async{    
    await showDialog(context: context, builder: (BuildContext context) {
      switch(popupType){
        case PopupTypeEnum.success:
          return SuccessPopup(popupText: popupText!);
        case PopupTypeEnum.error:
          return ErrorPopup(popupText: popupText!);
        case PopupTypeEnum.twoOptions:
          return const TwoOptionsPopup();
      }      
    });
  }

  openTwoOptionsPopup() async{
    await showDialog(context: context, builder: (BuildContext context) {return const TwoOptionsPopup();});
  }

  Future<bool> checkConnectivity() async{
    var connection = await Connectivity().checkConnectivity();
    return connection == ConnectivityResult.none;
  }  
}
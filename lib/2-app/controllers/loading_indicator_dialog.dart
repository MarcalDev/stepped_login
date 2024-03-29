import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

import 'base_controller.dart';

class LoadingIndicatorDialog with BaseController{
  static final LoadingIndicatorDialog _singleton = LoadingIndicatorDialog._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory LoadingIndicatorDialog(){
    return _singleton;
  }

  LoadingIndicatorDialog._internal();


  show(BuildContext context){
    if(isDisplayed){
      return;
    }
    showDialog<void>(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context){
        _context = context;
        isDisplayed = true;
        return WillPopScope(
          child: SimpleDialog(
            titlePadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),   
            backgroundColor: Colors.transparent,
            elevation: 0,    
            children: [
              Center(
                child: Container(     
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),                               
                  padding: const EdgeInsets.all(25),
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                ),
              )
            ],
          ), 
          onWillPop:() async => false
          );
      }
      );
  }

  dismiss(){
    if(isDisplayed){
      Navigator.of(_context).pop();
      isDisplayed=false;
    }
  }
}
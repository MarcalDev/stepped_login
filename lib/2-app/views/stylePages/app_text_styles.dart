import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

class AppTextStyles{

static const  TextStyle buttonText = TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: Colors.white);
static const  TextStyle textFieldTitle = TextStyle(fontSize: 17,fontWeight: FontWeight.w400);
static const  TextStyle textPopupTitle = TextStyle(fontSize: 17,fontWeight: FontWeight.bold);
static const  TextStyle textPopupOptions = TextStyle(fontSize: 13,fontWeight: FontWeight.w400, color: Colors.black);
static const  TextStyle textDescription = TextStyle(fontSize: 14,fontWeight: FontWeight.w400);
static  TextStyle textHyperlink = TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: AppColors.primaryColor, fontStyle: FontStyle.italic);
static TextStyle textLeftError = TextStyle(fontSize: 13,fontWeight: FontWeight.w400, color: AppColors.errorColor);

}
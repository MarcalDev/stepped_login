import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

class AppTextStyles{

static const  TextStyle buttonText = TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white);
static TextStyle buttonSecondaryText = TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.buttonTextColor );
static const  TextStyle textFieldTitle = TextStyle(fontSize: 17,fontWeight: FontWeight.w400);
static const  TextStyle textPopupTitle = TextStyle(fontSize: 18,fontWeight: FontWeight.w500);
static const  TextStyle textPopupDescription = TextStyle(fontSize: 16);
static  TextStyle textPopupOptions = TextStyle(fontSize: 13,fontWeight: FontWeight.w400, color: AppColors.inputHintColor);
static const  TextStyle textDescription = TextStyle(fontSize: 14,fontWeight: FontWeight.w400);
static  TextStyle textHyperlink = TextStyle(fontSize: 13,fontWeight: FontWeight.w400, color: AppColors.inputHintColor, fontStyle: FontStyle.italic, decoration: TextDecoration.underline);
static TextStyle textLeftError = TextStyle(fontSize: 13,fontWeight: FontWeight.w400, color: AppColors.errorColor);
static TextStyle codeFielText = TextStyle(fontSize: 22, fontWeight: FontWeight.w500,color: AppColors.primaryColor );

}
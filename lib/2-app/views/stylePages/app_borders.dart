import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppBorders{
  static final InputBorder textInputBorder = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: AppColors.inputTextColor)); 
  static final InputBorder textInputBorderError = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: AppColors.errorColor)); 
}
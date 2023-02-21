import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtonStyles{

  static final ButtonStyle primaryButtonStyle = ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),  
                fixedSize: MaterialStateProperty.all<Size>(Size(125,45)),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  side: BorderSide(
                  color: AppColors.thirdColor,
                  width: 1,
                  style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(8)
                )),
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center
              );

  static final ButtonStyle secundaryButtonStyle = ButtonStyle(    
                shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),                  
                fixedSize: MaterialStateProperty.all<Size>(Size(125,45)),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  side: BorderSide(
                  color: AppColors.inputHintColor,
                  width: 1,
                  style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(8)
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),                
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center
              );

 static final ButtonStyle errorButtonStyle = ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),  
                fixedSize: MaterialStateProperty.all<Size>(Size(125,45)),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  side: BorderSide(
                  color: AppColors.errorColor,
                  width: 1,
                  style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(8)
                )),
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.errorColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center
              );
}
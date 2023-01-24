import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtonStyles{
  static final ButtonStyle primaryButtonStyle = ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center
              );
}
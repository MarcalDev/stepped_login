import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

import '../views/stylePages/app_text_styles.dart';

class TextButtonWidget extends StatefulWidget {
  TextButtonWidget({
    required this.text,
    super.key
    });
    String text = "";

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){}, 
      child: Text(widget.text, style: AppTextStyles.buttonText),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
        textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
        elevation: MaterialStateProperty.all<double>(0),
        alignment: Alignment.center
      ),
      );
  }
}
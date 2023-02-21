
import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_button_styles.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class ErrorPopup extends StatefulWidget {
  const ErrorPopup({
     super.key,
     required this.popupText
    });
    final String popupText;

  @override
  State<ErrorPopup> createState() => _ErrorPopupState();
}

class _ErrorPopupState extends State<ErrorPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(0,40,0,25),
      content: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('images/remove.png', height: 60),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,25,15,20),
            child: Text(widget.popupText, style: AppTextStyles.textPopupTitle, textAlign: TextAlign.center,) 
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            width: double.infinity,
            child: TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Continuar", style: AppTextStyles.buttonText),style: AppButtonStyles.errorButtonStyle,)
          )          
        ]
        ),
    )
    )
      );
  }
}
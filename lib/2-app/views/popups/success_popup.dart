import 'package:flutter/material.dart';

import '../stylePages/app_button_styles.dart';
import '../stylePages/app_text_styles.dart';

class SuccessPopup extends StatefulWidget {
  const SuccessPopup({
    super.key,
    required this.popupText
    });
  final String popupText;

  @override
  State<SuccessPopup> createState() => _SuccessPopupState();
}

class _SuccessPopupState extends State<SuccessPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Image.asset('images/check.png', height: 60),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,25,15,20),
            child: Text(widget.popupText, style: AppTextStyles.textPopupDescription, textAlign: TextAlign.center,) 
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            width: double.infinity,
            child: TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Continuar", style: AppTextStyles.buttonText),style: AppButtonStyles.primaryButtonStyle,)
          )          
        ]
        ),
    )
    )
    );
    }
}
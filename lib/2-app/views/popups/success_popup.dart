import 'package:flutter/material.dart';

import '../stylePages/app_button_styles.dart';
import '../stylePages/app_text_styles.dart';

class SuccessPopup extends StatefulWidget {
  SuccessPopup({
    super.key,
    required this.popupText
    });
  String popupText;

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
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10,30,10,10),
      content: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('images/check.png', height: 70),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 15),
            child: Text(widget.popupText, style: AppTextStyles.textPopupTitle, textAlign: TextAlign.center,) 
            ),
          Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            child: TextButton(onPressed: (){Navigator.pop(context);}, child: Text("OK", style: AppTextStyles.buttonText),style: AppButtonStyles.primaryButtonStyle,)
          )          
        ]
        ),
    )
    );
 }
}
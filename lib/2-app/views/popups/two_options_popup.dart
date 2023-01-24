import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_button_styles.dart';

import '../stylePages/app_colors.dart';
import '../stylePages/app_text_styles.dart';

class TwoOptionsPopup extends StatefulWidget {
  const TwoOptionsPopup({super.key});

  @override
  State<TwoOptionsPopup> createState() => _TwoOptionsPopupState();
}

class _TwoOptionsPopupState extends State<TwoOptionsPopup> {
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10,20,10,10),
      content: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Tem certeza que deseja cancelar? ", style: AppTextStyles.textPopupTitle),
          Padding(
            padding: EdgeInsets.only(top:25, bottom: 10),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: TextButton(
                  child: Text("SIM", style: AppTextStyles.buttonText),
                  style: AppButtonStyles.primaryButtonStyle,
                  onPressed: (){
                    Navigator.pop(context, true);
                  },
                )             
              ),
              TextButton(
                onPressed: (){
                    Navigator.pop(context, false);
                  },
                child: Text("NÃO", style: AppTextStyles.buttonText),
                style: AppButtonStyles.primaryButtonStyle,
                )
              ],
          )
          )
        ]
        ),
    )
    );
  }
}
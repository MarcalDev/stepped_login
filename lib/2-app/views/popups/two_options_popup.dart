import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_button_styles.dart';
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
      contentPadding: const EdgeInsets.fromLTRB(10,30,10,10),
      content: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Deseja sair? ", style: AppTextStyles.textPopupTitle),
          Padding(
            padding: const EdgeInsets.only(top:25, bottom: 10),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  child: Text("Sim", style: AppTextStyles.buttonText),
                  style: AppButtonStyles.errorButtonStyle,
                  onPressed: (){
                    Navigator.pop(context, true);
                  },
                )             
              ),
              TextButton(
                onPressed: (){
                    Navigator.pop(context, false);
                  },
                child: Text("Cancelar", style: AppTextStyles.buttonSecondaryText),
                style: AppButtonStyles.secundaryButtonStyle,
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
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stepped_login/2-app/views/popups/two_options_popup.dart';
import 'package:stepped_login/2-app/views/stylePages/app_button_styles.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class VerifyEmailPopup extends StatefulWidget {
  const VerifyEmailPopup(    
    {
      required this.Email,
      required this.Code,
      super.key
    });
    final String Email;
    final String Code;
  @override
  State<VerifyEmailPopup> createState() => _VerifyEmailPopupState();
}

class _VerifyEmailPopupState extends State<VerifyEmailPopup> {


  String? verifyCode(String? code){
    if(code != "" && code != widget.Code && code!.length >3)
      return "Código incorreto*";

    if(code != "" && code == widget.Code && code!.length >3)
      Navigator.pop(context, true);

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(context: context, builder: (BuildContext context) {return const TwoOptionsPopup();}),
      child: AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10,30,10,20),
      content: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Verifique seu e-mail", style: AppTextStyles.textPopupTitle),                     
                    ),                    
                    Text("Por favor, verifique o código que enviamos a ${widget.Email}", style: AppTextStyles.textPopupOptions, textAlign: TextAlign.center)
                  ],
                ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              validator: verifyCode,
              appContext: context, 
              length: 4,
              textStyle: AppTextStyles.codeFielText,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(3),
                fieldHeight: 65,
                fieldWidth: 60,
                activeFillColor: Colors.white,
                disabledColor: Colors.white,
                inactiveColor: AppColors.inputBackgroundColor,
                activeColor: AppColors.primaryColor,
                selectedColor: AppColors.secondaryColor,
                errorBorderColor: AppColors.errorColor,
                borderWidth: 1
              ),
              onChanged: (_){}
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [                    
                    Text(
                      "Não recebeu o código? ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400, 
                        color: AppColors.inputHintColor)
                    ),
                    Text("Reenviar", style: AppTextStyles.textHyperlink, textAlign: TextAlign.center)
                  ],
                )           
                )             
              
          ],
        )

      ),
    ), 
      );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:stepped_login/2-app/views/stylePages/app_button_styles.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class PickPicturePopup extends StatefulWidget {
  const PickPicturePopup({super.key});

  @override
  State<PickPicturePopup> createState() => _PickPicturePopupState();
}

class _PickPicturePopupState extends State<PickPicturePopup> {

  RegisterController Controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10,20,10,10),
      content: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Selecionar imagem", style: AppTextStyles.textPopupTitle),
          Padding(
            padding: const EdgeInsets.only(top:25, bottom: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child:
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),  
                    fixedSize: MaterialStateProperty.all<Size>(Size(180,55)),
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
                  ),
                  onPressed: () {
                    Controller.takePicture(false);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.photo_library_rounded, size: 20, color: Colors.white)
                      ),
                      Text(
                        "Galeria",
                        style: AppTextStyles.buttonText,
                      )
                    ],
                  ),
                ) ,
              ),
              ElevatedButton(
                  style: ButtonStyle(    
                    shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),                  
                    fixedSize: MaterialStateProperty.all<Size>(Size(180,55)),
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
                  ),
                  onPressed: () {
                    Controller.takePicture(true);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.camera_alt, size: 20, color: AppColors.buttonTextColor)
                      ),
                      Text(
                        "Câmera",
                        style: AppTextStyles.buttonSecondaryText,
                      )
                    ],
                  ),
                ) ,
                            ],
          )
          )
        ]
        ),
    )
    );
  }
}
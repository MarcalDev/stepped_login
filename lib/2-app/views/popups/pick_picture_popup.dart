import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
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
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Anexar foto com", style: AppTextStyles.textPopupTitle),
          Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: ElevatedButton(       
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonBackgroundColor),
                  shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),
                  elevation: MaterialStateProperty.all<double?>(0),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),)
                ),
                onPressed: (){
                   Controller.TakePicture(false);
                   Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,              
                    children: <Widget>[ 
                       Container(                        
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(23)),
                          color: AppColors.thirdColor
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.photo_library_rounded, size: 45, color: Colors.white),
                       ),   
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Galeria", style: AppTextStyles.textPopupOptions)
                        )   
                    ],
                  )
                )
                ),
              
              ),
              ElevatedButton(                
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonBackgroundColor),
                  shadowColor: MaterialStateProperty.all<Color>(AppColors.buttonShadowColor),
                  elevation: MaterialStateProperty.all<double?>(0),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
                  child: Column(      
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,            
                    children: <Widget>[   
                      Container(                        
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(23)),
                          color: AppColors.thirdColor
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.camera_alt, size: 45, color: Colors.white),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Câmera", style: AppTextStyles.textPopupOptions)
                        )                      
                    ],
                  )
                ),
                onPressed: () {
                  Controller.TakePicture(true);
                  Navigator.pop(context);
                } ,                                
                ),
            ],
          )
          )
        ]
        ),
    )
    );
  }
}
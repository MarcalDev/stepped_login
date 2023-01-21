import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/views/popups/pick_picture_popup.dart';

import '../../../controllers/register_controller.dart';

class ProfilePicPartial extends StatefulWidget {
  const ProfilePicPartial({Key? key}) : super(key: key);

  @override
  State<ProfilePicPartial> createState() => _ProfilePicPartialState();
}

class _ProfilePicPartialState extends State<ProfilePicPartial> {
  RegisterController _register_controller = Get.find();

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.all(0),
      child: Center(
        child: Column(          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const Text("Selecione sua foto de perfil"),
            Padding(
              padding: EdgeInsets.fromLTRB(0,45,0,0),
              child: Obx(
                () => GestureDetector(
                onTap: (){showDialog(context: context, builder: (BuildContext context) {return PickPicturePopup();});
                },
                child: (_register_controller.showPicture.value)
              ?  CircleAvatar(
                      backgroundImage:  FileImage(File(_register_controller.profilePicturePath.value)),
                      radius: 100,
                      )
                :
                const CircleAvatar(
                backgroundImage:  AssetImage('images/icon_user.jpeg'),
                radius: 100,
                )              
              )                 
              )
              )  ,    
            const Text("Pular"),
          ],
        )
      )
      );
    
  }
}

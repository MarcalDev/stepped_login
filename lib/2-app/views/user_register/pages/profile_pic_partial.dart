import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_controller.dart';

class profile_pic_partial extends StatefulWidget {
  const profile_pic_partial({Key? key}) : super(key: key);

  @override
  State<profile_pic_partial> createState() => _profile_pic_partialState();
}

class _profile_pic_partialState extends State<profile_pic_partial> {
  register_controller _register_controller = Get.find();

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
                onTap: () => _register_controller.TakePicture(true),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';

class PickPicturePopup extends StatefulWidget {
  const PickPicturePopup({super.key});

  @override
  State<PickPicturePopup> createState() => _PickPicturePopupState();
}

class _PickPicturePopupState extends State<PickPicturePopup> {

  register_controller Controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(10,20,10,10),
      content: Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Anexar foto com"),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(       
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double?>(0.2)
                ),
                onPressed: (){
                   Controller.TakePicture(false);
                   Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: Column(    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,              
                    children: [                    
                      Icon(Icons.photo_library_rounded, size: 40, color: Colors.black),
                      Text("Galeria", style: TextStyle(color: Colors.black))
                    ],
                  )
                )
                ),
              ElevatedButton(                
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double?>(0.2)
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: Column(      
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,            
                    children: [                    
                      Icon(Icons.camera_alt_rounded, size: 40, color: Colors.black),
                      Text("Camera", style: TextStyle(color: Colors.black),)
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
import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:get/get.dart';

class password_partial extends StatefulWidget {
  const password_partial({Key? key}) : super(key: key);

  @override
  State<password_partial> createState() => _password_partialState();
}

class _password_partialState extends State<password_partial> {
  register_controller _register_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: text_field_widget(editing_controller: _register_controller.password_controller, hint_text: "Digite sua senha*",isPassword: true, on_changed: _register_controller.setPassword),              
            ),      
            text_field_widget(editing_controller: _register_controller.second_password_controller, hint_text: "Repita a senha*",isPassword: true, isLastField: true, on_changed: _register_controller.setSecondPassword),                  
          ],
        )
      ),
    );
  }
}

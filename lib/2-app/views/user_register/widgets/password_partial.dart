import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:get/get.dart';

class PasswordPartial extends StatefulWidget {
  const PasswordPartial({Key? key}) : super(key: key);

  @override
  State<PasswordPartial> createState() => _PasswordPartialState();
}

class _PasswordPartialState extends State<PasswordPartial> {
  RegisterController _register_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextFieldWidget(editing_controller: _register_controller.password_controller, hint_text: "Digite sua senha*",isPassword: true),              
            ),      
            TextFieldWidget(editing_controller: _register_controller.second_password_controller, hint_text: "Repita a senha*",isPassword: true, isLastField: true),                  
          ],
        )
      ),
    );
  }
}

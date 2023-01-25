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
  final RegisterController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextFieldWidget(editingController: _controller.passwordController, hintText: "Digite sua senha*",isPassword: true),              
            ),      
            TextFieldWidget(editingController: _controller.secondPasswordController, hintText: "Repita a senha*",isPassword: true, isLastField: true),                  
          ],
        )
      ),
    );
  }
}

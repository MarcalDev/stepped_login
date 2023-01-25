import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:get/get.dart';

class BasicDataPartial extends StatefulWidget {
  const BasicDataPartial({Key? key}) : super(key: key);

  @override
  State<BasicDataPartial> createState() => _BasicDataPartialState();
}

class _BasicDataPartialState extends State<BasicDataPartial> {
  
  final RegisterController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldWidget(editingController: _controller.nameController, hintText: "Digite seu nome*"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFieldWidget(editingController: _controller.emailController, hintText: "Digite seu e-mail*", isEmail: true)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    padding: const EdgeInsets.all(0),
                    child: TextFieldWidget(editingController: _controller.phoneAreaController, hintText: "DDD ",isPhoneArea: true)  
                  ),
                Container(
                    width: 265,
                    padding: const EdgeInsets.all(0),
                    child: TextFieldWidget(editingController: _controller.phoneNumberController, hintText: "Celular",isPhoneNumber: true, isLastField: true),
                )
            ],
            )
          ],
          )
    );
  }
}

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
      child: Obx(() => 
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldWidget(editingController: _controller.nameController, labelText: "Nome*", hintText: "Digite seu nome",showErrorInput: _controller.showNameError.value, fieldRequirements: _controller.nameRequirementsList.value),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFieldWidget(editingController: _controller.emailController, labelText: "E-mail*", hintText: "exemplo@email.com", isEmail: true, showErrorInput: _controller.showEmailError.value,fieldRequirements: _controller.emailRequirementsList.value)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    padding: const EdgeInsets.all(0),
                    child: TextFieldWidget(editingController: _controller.phoneAreaController, labelText: "DDD ",isPhoneArea: true)  
                  ),
                Container(
                    width: 265,
                    padding: const EdgeInsets.all(0),
                    child: TextFieldWidget(editingController: _controller.phoneNumberController, labelText: "Celular",isPhoneNumber: true, isLastField: true),
                )
            ],
            )
          ],
          )    
      )
      );
  }
}

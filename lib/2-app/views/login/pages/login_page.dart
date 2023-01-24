import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/controllers/login_controller.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

import '../../../components/text_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginController Controller = Get.put(LoginController(context:  context));   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(  
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text('Usuário', style: AppTextStyles.textFieldTitle),
                  ),                  
                  TextFieldWidget(hint_text: 'Digite seu e-mail', editing_controller: Controller.email_controller, isEmail: true),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 15, 0, 5),
                    child: Text('Senha',style: AppTextStyles.textFieldTitle)
                  ),
                  TextFieldWidget(hint_text: 'Digite sua senha', editing_controller: Controller.password_controller, isLastField: true, isPassword: true),                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Checkbox(value: Controller.saveUserLogin.value, onChanged: (value){ Controller.saveUserLogin.value = value!;}, checkColor: Colors.white, activeColor: AppColors.thirdColor)),
                      Text('Salvar usuário e senha', style: AppTextStyles.textDescription)
                    ],
                  )
                ],
            ),
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 120),
            width: double.infinity,
            child: TextButton(
              onPressed: () => Controller.loginUser(), 
              child: Text("ENTRAR", style: AppTextStyles.buttonText),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center
              ),
              )
          )
          
        ],        
      ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(32),
        child: GestureDetector(
          onTap: () => Controller.PushToRegisterPage(),
          child: Text("Não possui uma conta? Cadastre-se", textAlign: TextAlign.center, style: AppTextStyles.textDescription),
        )
      )
    );
  }
}
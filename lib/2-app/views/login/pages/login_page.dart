import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/controllers/login_controller.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(context:  context));   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(  
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text('Usuário', style: AppTextStyles.textFieldTitle),
                  ),                  
                  TextFieldWidget(hintText: 'Digite seu e-mail', editingController: controller.emailController, isEmail: true),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 15, 0, 5),
                    child: Text('Senha',style: AppTextStyles.textFieldTitle)
                  ),
                  TextFieldWidget(hintText: 'Digite sua senha', editingController: controller.passwordController, isLastField: true, isPassword: true),                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Checkbox(value: controller.saveUserLogin.value, onChanged: (value){ controller.saveUserLogin.value = value!;}, checkColor: Colors.white, activeColor: AppColors.thirdColor)),
                      const Text('Salvar usuário e senha', style: AppTextStyles.textDescription)
                    ],
                  )
                ],
            ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(top: 120),
            width: double.infinity,
            child: TextButton(
              onPressed: () => controller.loginUser(), 
              child: const Text("ENTRAR", style: AppTextStyles.buttonText),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.fromLTRB(15, 10, 15, 10)),
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
        padding: const EdgeInsets.all(32),
        child: GestureDetector(
          onTap: () => controller.pushToRegisterPage(),
          child: Container(
            padding: const EdgeInsets.all(8),
            child:const Text("Não possui uma conta? Cadastre-se", textAlign: TextAlign.center, style: AppTextStyles.textDescription),
          )
        )
      )
    );
  }
}
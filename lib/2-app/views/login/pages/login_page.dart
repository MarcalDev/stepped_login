import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';
import 'package:stepped_login/2-app/components/text_form_field_email.dart';
import 'package:stepped_login/2-app/components/text_form_field_password_widget.dart';
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
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(context:  context));   
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(        
      backgroundColor: Colors.white,
      body: Column(        
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(32),
              children: [
                Obx(
                  () => Form(                
                child: Column(                
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [                  
                  TextFormFieldEmailWidget(labelText: "E-mail*", editingController: controller.emailController, hintText: "exemplo@email.com", fieldRequirements: controller.emailRequirementsList.value),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: TextFormFieldPasswordWidget(editingController: controller.passwordController, labelText: "Digite sua senha*", fieldRequirements: controller.passwordRequirementsList.value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Checkbox(value: controller.saveUserLogin.value, onChanged: (value){ controller.saveUserLogin.value = value!;}, checkColor: Colors.white, activeColor: AppColors.thirdColor)),
                      const Text('Salvar usuário e senha', style: AppTextStyles.textDescription)
                    ],
                  )
                ],
                ),
              ),

                )
              ],
            ),
          Container(
            padding: EdgeInsets.all(32),
            width: double.infinity,
            child: TextButton(
              onPressed: () => controller.loginUser(), 
              child: const Text("ENTRAR", style: AppTextStyles.buttonText),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.thirdColor),
                fixedSize: MaterialStateProperty.all<Size>(Size(125,45)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                textStyle: MaterialStateProperty.all<TextStyle>(AppTextStyles.buttonText), 
                elevation: MaterialStateProperty.all<double>(0),
                alignment: Alignment.center,
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  side: BorderSide(
                  color: AppColors.thirdColor,
                  width: 1,
                  style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(8)
                )),
              ),
              )
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [            
            GestureDetector(
            onTap: () => controller.pushToRegisterPage(),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui uma conta? ", textAlign: TextAlign.center, style: AppTextStyles.textDescription),
                  Text("Cadastre-se", textAlign: TextAlign.center, style: AppTextStyles.textHyperlink),
                ],
              )
            )
          )

          ],
        )
      )
    )
    );
  }
}
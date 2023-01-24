import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    LoginController Controller = Get.put(LoginController(context:  context));   
    return Container(child: Center(child: Text("USUÁRIO LOGADO")),);
  }
}
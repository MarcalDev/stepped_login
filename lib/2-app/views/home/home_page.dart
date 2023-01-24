import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepped_login/1-base/models/user.dart';
import 'package:stepped_login/2-app/controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.user
    });
  User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    LoginController Controller = Get.put(LoginController(context:  context));   
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.user.id!),
          Text(widget.user.name!),
          Text(widget.user.email!),
          Text(widget.user.phoneNumber!),          
        ],
        )
        
        )  
    );
  }
}
import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';

class password_partial extends StatefulWidget {
  const password_partial({Key? key}) : super(key: key);

  @override
  State<password_partial> createState() => _password_partialState();
}

class _password_partialState extends State<password_partial> {

  TextEditingController _password_controller = TextEditingController();
  TextEditingController _second_password_controller = TextEditingController();
  bool _show_first_password = true;
  bool _show_second_password = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: text_field_widget(editing_controller: _password_controller, hint_text: "Digite sua senha*",isPassword: true),              
            ),      
            text_field_widget(editing_controller: _second_password_controller, hint_text: "Repita a senha*",isPassword: true, isLastField: true),                  
          ],
        )
      ),
    );
  }
}

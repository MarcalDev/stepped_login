import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/components/text_field_widget.dart';

class basic_data_partial extends StatefulWidget {
  const basic_data_partial({Key? key}) : super(key: key);

  @override
  State<basic_data_partial> createState() => _basic_data_partialState();
}

class _basic_data_partialState extends State<basic_data_partial> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _phone_area_controller = TextEditingController();
  TextEditingController _phone_number_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text_field_widget(editing_controller: _name_controller, hint_text: "Digite seu nome*"),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: text_field_widget(editing_controller: _email_controller, hint_text: "Digite seu e-mail*", isEmail: true,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    padding: const EdgeInsets.all(0),
                    child: text_field_widget(editing_controller: _phone_area_controller, hint_text: "DDD ",isPhoneArea: true)  
                  ),
                Container(
                    width: 265,
                    padding: const EdgeInsets.all(0),
                    child: text_field_widget(editing_controller: _phone_number_controller, hint_text: "Celular",isPhoneNumber: true, isLastField: true,),
                )
            ],
            )
          ],
          )
    );
  }
}

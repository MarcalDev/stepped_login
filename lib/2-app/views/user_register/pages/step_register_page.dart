import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/profile_pic_partial.dart';

class step_register_page extends StatefulWidget {
  const step_register_page({Key? key}) : super(key: key);

  @override
  State<step_register_page> createState() => _step_register_pageState();
}

class _step_register_pageState extends State<step_register_page> {

  late int _partialIndex = 0;

  List<Widget> partialsList = [
    const basic_data_partial(), 
    const password_partial(), 
    const profile_pic_partial()
    ];
  @override
  Widget build(BuildContext context) {
    print(_partialIndex.toString());
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: partialsList[_partialIndex],
            )
          ],
        ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(32,0,32,32),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (_partialIndex >0)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex - 1;                  
                });
                print(_partialIndex.toString());
              }, 
              child: Text("Anterior")
              ) : const Text(""),
            (_partialIndex < 2)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex + 1;   
                });
                print(_partialIndex.toString());
              }, 
              child: Text("Avançar")
              ) : const Text(""),
          ]
          ),
          )
    );
  }
}

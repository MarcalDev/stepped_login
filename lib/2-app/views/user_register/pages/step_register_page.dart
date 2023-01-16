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

  double _progress_value = 0.0;
  late int _partialIndex = 0;
  bool _show_step_icon = true;
  String _actual_step_icon = "";
  int _primary_color = 0xff3B935F;
  int _second_color = 0xff99D7B0;

  List<Widget> partialsList = [
    const basic_data_partial(), 
    const password_partial(), 
    const profile_pic_partial()
    ];
  @override
  Widget build(BuildContext context) {
    //print(_partialIndex.toString());
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,      
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
              child: LinearProgressIndicator(
              minHeight: 10,
              value: _progress_value,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(_primary_color)),
              backgroundColor: Color(_second_color),
              )
            ),
            (_show_step_icon)
            ? Column(
              children: [
                Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Container(
                    height: 150,
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                    color: const Color(0xff62C185),
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(_actual_step_icon))
                  ),                
                )
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 45),
                  child: Text("Preencha as informações abaixo:")
                  ),
              ],
            ): Container(),
             
            
            Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: (_partialIndex > 1) ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                  child: partialsList[_partialIndex],
                  )) 
              ],
              )
            )            
          ],
        ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(32,0,32,32),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (_partialIndex >0)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex - 1;  
                  _progress_value -= 0.33;   
                  _show_step_icon = (_partialIndex <= 1) ? true : false;
                  _actual_step_icon = (_partialIndex < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
                });
                
                //print(_partialIndex.toString());
              }, 
              child: Text(
                      "Anterior",
                      style: TextStyle(
                        color: Color(_primary_color)
                      ),
                      )
              ) : const Text(""),
            (_partialIndex < 2)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex + 1;  
                  _progress_value += 0.33; 
                  _show_step_icon = (_partialIndex == 2) ? false : true;
                  _actual_step_icon = (_partialIndex >= 1) ? "images/lock_image.png" : "images/clipboard_image.png";
                });
                
                //print(_partialIndex.toString());
              }, 
              child: Text(
                      "Avançar",
                      style: TextStyle(
                        color: Color(_primary_color)),
                      )
              ) : const Text(""),
          ]
          ),
          )
    );
  }
}

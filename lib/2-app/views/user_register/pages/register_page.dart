import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/user_register/pages/basic_data_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/password_partial.dart';
import 'package:stepped_login/2-app/views/user_register/pages/profile_pic_partial.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  int _actualPartialIndex = 0;
  //List _partial_list = [basic_data_partial(), password_partial(), profile_pic_partial()];
  
  // actualPartiaWidget(){
  //   switch(_actualPartialIndex){
  //     case 0:
  //       setState(() {
  //         partial_widget = basic_data_partial();
  //       });
  //       break;
  //     case 1:
  //       setState(() {
  //         partial_widget = basic_data_partial();
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         partial_widget = basic_data_partial();
  //       });
  //       break;
  //     default:
  //       break;
  //   }
  // }

  // List<Step> getSteps(){
  //   return <Step>[
  //     Step(
  //       state: _actualPartialIndex > 0 ? StepState.complete : StepState.indexed,
  //       isActive: _actualPartialIndex >= 0,
  //       content: basic_data_partial(),
  //       title: Text(""),
  //     ),
  //     Step(
  //       state: _actualPartialIndex > 1 ? StepState.complete : StepState.indexed,
  //       isActive: _actualPartialIndex >= 1,
  //       content: password_partial(),
  //       title: Text(""),
  //     ),
  //     Step(
  //       state: _actualPartialIndex > 2 ? StepState.complete : StepState.indexed,
  //       isActive: _actualPartialIndex >= 2,
  //       content: profile_pic_partial(),
  //       title: Text(""),
  //     )
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Text("Pronto")

        ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _actualPartialIndex > 0
            ? TextButton(
                onPressed: (){
                  setState(() {
                    _actualPartialIndex = _actualPartialIndex - 1;
                    print("index: " + _actualPartialIndex.toString());
                  });
                },
                child: Text("Anterior")
            ) : Container(),
            _actualPartialIndex <= 1
            ? TextButton(
                onPressed: (){
                  setState(() {
                    _actualPartialIndex = _actualPartialIndex + 1;
                    print("index: " + _actualPartialIndex.toString());
                  });
                },
                child: Text("Avançar")
            ) : Container()
          ],
        )
      )
    );
  }
}

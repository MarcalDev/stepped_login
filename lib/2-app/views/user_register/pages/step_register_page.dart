import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

class StepRegisterPage extends StatefulWidget {
  const StepRegisterPage({Key? key}) : super(key: key);

  @override
  State<StepRegisterPage> createState() => _StepRegisterPageState();
}

class _StepRegisterPageState extends State<StepRegisterPage> {

  double _progress_value = 0.0;
  late int _partialIndex = 0;
  bool _show_step_icon = true;
  String _actual_step_icon = "images/clipboard_image.png";  
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    RegisterController Controller = Get.put(RegisterController(context: context));
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                    child: 
                    TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 650),
                        curve: Curves.easeInOut,
                        tween: Tween<double>(
                            begin: 0,
                            end: _progress_value,
                        ),
                        builder: (context, value, _) =>
                            LinearProgressIndicator(minHeight: 8,value: value,backgroundColor: AppColors.secondaryColor,valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor)),
                    ),
                    // LinearProgressIndicator(
                    //   minHeight: 10,
                    //   value: _progress_value,
                    //   valueColor: AlwaysStoppedAnimation<Color>(
                    //       Color(_primary_color)),
                    //   backgroundColor: Color(_second_color),
                    //)
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
                              color: AppColors.thirdColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(_actual_step_icon))
                          ),
                        )
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 45, 0, 30),
                        child: Text("Preencha as informações abaixo:")
                    ),
                  ],
                ): Container(),
                
                Padding(
                  padding: (_partialIndex == 2) ? EdgeInsets.only(top: 70) : EdgeInsets.all(0),
                  child: Container(
                  height: 300,                  
                  padding: EdgeInsets.all(0),
                  child: PageView(                  
                  scrollDirection: Axis.horizontal,
                  pageSnapping: false,
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: <Widget>[
                    Controller.firstPage,
                    Controller.secondPage,
                    Controller.thirdPage
                  ],
                )
                )        
                ) 
              ],
            ),
          )
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(32,0,32,32),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (_partialIndex != 0)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex - 1;  
                  _progress_value -= 0.33;   
                  _show_step_icon = (_partialIndex <= 1) ? true : false;
                  _actual_step_icon = (_partialIndex < 1) ? "images/clipboard_image.png" : "images/lock_image.png"; 
                });
                pageController.jumpToPage(_partialIndex);
              }, 
              child: Text("Anterior",style: TextStyle(color: AppColors.primaryColor))) 
              : TextButton(
              onPressed: ()=> Get.back(), 
              child: Text("Cancelar",style: TextStyle(color: AppColors.inputTextColor))
              ),
              
            (_partialIndex < 2)
            ? TextButton(
              onPressed: (){
                setState(() {
                  _partialIndex = _partialIndex + 1;  
                  _progress_value += 0.33; 
                  _show_step_icon = (_partialIndex == 2) ? false : true;
                  _actual_step_icon = (_partialIndex >= 1) ? "images/lock_image.png" : "images/clipboard_image.png";
                });
                pageController.jumpToPage(_partialIndex);
                //print(_partialIndex.toString());
              }, 
              child: Text(
                      "Avançar",
                      style: TextStyle(
                        color: AppColors.primaryColor),
                      )
              ) : const Text(""),
          ]
          ),
          )
    );
  }
}

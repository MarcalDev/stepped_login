import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

import '../../popups/two_options_popup.dart';

class StepRegisterPage extends StatefulWidget {
  const StepRegisterPage({Key? key}) : super(key: key);

  @override
  State<StepRegisterPage> createState() => _StepRegisterPageState();
}

class _StepRegisterPageState extends State<StepRegisterPage> {
  @override
  Widget build(BuildContext context) {
    final RegisterController Controller = Get.put(RegisterController(context: context));
    return WillPopScope(      
      onWillPop: () async => await showDialog(context: context, builder: (BuildContext context) {return const TwoOptionsPopup();}),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: Obx(
                        () => TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 650),
                          curve: Curves.easeInOut,
                          tween: Tween<double>(
                              begin: 0,
                              end: Controller.progressValue.value,
                          ),
                          builder: (context, value, _) =>
                              LinearProgressIndicator(minHeight: 8,value: value,backgroundColor: AppColors.secondaryColor,valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor)),
                      ),                   
                      )                    
                  ),
                  Obx(() => 
                    (Controller.showStepIcon.value)
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
                                image: DecorationImage(image: AssetImage(Controller.actualStepIcon.value))
                            ),
                          )
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(0, 45, 0, 30),
                          child: Text("Preencha as informações abaixo:")
                      ),
                    ],
                  ): Container(),                
                  ),
                  Padding(
                    padding: (Controller.partialIndex.value == 2) ? const EdgeInsets.only(top: 70) : const EdgeInsets.all(0),
                    child: Container(
                    height: 300,                  
                    padding: const EdgeInsets.all(0),
                    child: PageView(                  
                    scrollDirection: Axis.horizontal,
                    pageSnapping: false,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: Controller.pageController,
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
            child: Obx(
              () => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (Controller.partialIndex.value != 0)
              ? TextButton(
                onPressed: (){
                  Controller.checkBackPage();
                }, 
                child: Text("Anterior",style: TextStyle(color: AppColors.primaryColor))) 
                : TextButton(
                onPressed: () async{
                  var resultTwoOptions = await showDialog(context: context, builder: (BuildContext context) {return const TwoOptionsPopup();});
                  if(resultTwoOptions == true){
                    Get.back();
                  }else{
                    
                  }
                }, 
                child: Text("Cancelar",style: TextStyle(color: AppColors.inputTextColor))
                ),
                
              (Controller.partialIndex.value < 2)
              ? TextButton(
                onPressed: (){                
                  Controller.checkNextPage();                
                }, 
                child: Text(
                        "Avançar",
                        style: TextStyle(
                          color: AppColors.primaryColor),
                        )
                ) : TextButton(
                onPressed: () => Controller.insertUser(),
                child: Text(
                        "Concluir",
                        style: TextStyle(
                          color: AppColors.primaryColor),
                        )
                )
            ]
            ),          
            )
            )
      )  
      );      
    }
}

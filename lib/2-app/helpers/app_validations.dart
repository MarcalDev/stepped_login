import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppValidations{

  static List<String> validateEmailTextInput(TextEditingController textController){
    List<String> emailRequirementsList = [];
      if(textController.text.isNotEmpty){
        if(!textController.text.contains('@') || !textController.text.contains('.')){        
          emailRequirementsList.add('Insira um e-mail válido');        
        }
      }else{
        emailRequirementsList.add('Obrigatório*'); 
      } 
      return emailRequirementsList;  
  }


  static List<String> validateTextInput(TextEditingController textController){
    List<String> requirementsList = []; 

    if(textController.text.isEmpty){
      requirementsList.add('Obrigatório');
    }    
    return requirementsList;
  }
}
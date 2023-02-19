import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:stepped_login/1-base/services/service_base.dart';

import '../models/user.dart';

class UserService extends ServiceBase{
  

  Future getUsers() async {
    http.Response response = await http.get(Uri.parse("$baseUrl/api/User/Get"));
    if(response.statusCode==200){
      //("Usuarios : " + response.body);
      return usersFromJson(response.body);
    }else{
      return null;
    }
  }

   Future<User?> userAuthentication(String email, String password) async {
    try{
      http.Response response = await http.get(Uri.parse("$baseUrl/api/User/UserAuthentication?email=$email&password=$password"));
      if(response.statusCode==200){
        //print("Usuario : " + response.body);
        var user = userFromJson(response.body);
        return user;
      }else{
        return null;
      }
    } catch(ex){
      return null;
    }    
  }

  Future getUserById(UniqueKey id) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/api/User/GetUserById?id=$id"));
    if(response.statusCode==200){
      //print("Usuario : " + response.body);
      return userFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<bool> postUser(User user) async{
    try{
        final response = await http.post(
        Uri.parse(
          "$baseUrl/api/User/Post"      
        ),
        headers: {"content-type" : "application/json"},
        body: usersToJson(user),
      );

      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }  

    }catch(ex){
      //print("excessao: " + ex.toString());
      return false;
    }   
  }

  Future<bool> checkAlredyUsedEmail(String email) async{
    try{
      final response = await http.get(
        Uri.parse(
          "$baseUrl/api/User/checkAlredyUsedEmail?email=$email"
        ));
        
      return response.body == "true";
    }catch(ex){
      return false;
    }
  }
}
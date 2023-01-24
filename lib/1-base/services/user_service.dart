import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:stepped_login/1-base/services/service_base.dart';

import '../models/user.dart';

class UserService extends ServiceBase{
  

  Future getUsers() async {
    http.Response response = await http.get(Uri.parse("$baseUrl/api/User/Get"));
    if(response.statusCode==200){
      print("Usuarios : " + response.body);
      return UsersFromJson(response.body);
    }else{
      return null;
    }
  }

   Future userAuthentication(String email, String password) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/api/User/UserAuthentication?email=$email&password=$password"));
    if(response.statusCode==200){
      print("Usuario : " + response.body);
      return UserFromJson(response.body);
    }else{
      return null;
    }     
  }

  Future getUserById(UniqueKey id) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/api/User/GetUserById?id=$id"));
    if(response.statusCode==200){
      print("Usuario : " + response.body);
      return UserFromJson(response.body);
    }else{
      return null;
    }
  }
}
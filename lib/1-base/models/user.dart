import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stepped_login/1-base/models/base_model.dart';

class User extends BaseModel{  
  late String? name;
  late String? email;
  late String? phoneNumber;
  late String? password;
  User({
    super.id,
    super.isActive,
    super.realeseDate,
    this.name,
    this.email,
    this.phoneNumber,
    this.password
  });

  factory User.fromJson(Map<String, dynamic> map){
    return User(
      id: map["Id"], 
      name: map["Name"],
      email: map["Email"], 
      phoneNumber: map["PhoneNumber"], 
      password: map["Password"], 
      realeseDate: map["RealeaseDate"], 
      isActive: map["IsActive"]);
  }

  Map<String,dynamic> toJson(){
    return{
      "Id" : id,
      "Name" : name,
      "Email" : email,
      "PhoneNumber" : phoneNumber,
      "Password" : password,
      "RealeaseDate" : realeseDate,
      "isActive" : isActive
    };
  }
}

 List<User> UsersFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<User>.from(data.map((item) => User.fromJson(item)));
  }

  User UserFromJson(String jsonData){
    Map<String,dynamic> mapResponse = json.decode(jsonData);
    return User.fromJson(mapResponse);    
  }

  String UsersToJson(User data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
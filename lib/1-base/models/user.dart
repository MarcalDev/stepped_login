import 'dart:convert';
import 'package:stepped_login/1-base/models/base_model.dart';

class User extends BaseModel{  
  late String? name;
  late String? email;
  late String? phoneNumber;
  late String? password;
  User({
    super.id,    
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    super.realeaseDate,
    super.isActive
  });

  factory User.fromJson(Map<String, dynamic> map){
    return User(
      id: map["id"], 
      name: map["name"],
      email: map["email"], 
      phoneNumber: map["phoneNumber"], 
      password: map["password"], 
      realeaseDate: map["realeaseDate"], 
      isActive: (map["isActive"] == 0)? false : true);
  }

  Map<String,dynamic> toJson(){
    return{
      "Id" : id,
      "Name" : name,
      "Email" : email,
      "PhoneNumber" : phoneNumber,
      "Password" : password,
      "RealeaseDate" : realeaseDate,
      "isActive" : isActive
    };
  }
}

 List<User> usersFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<User>.from(data.map((item) => User.fromJson(item)));
  }

  User userFromJson(String jsonData){
    Map<String,dynamic> mapResponse = json.decode(jsonData);
    return User.fromJson(mapResponse);    
  }

  String usersToJson(User data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
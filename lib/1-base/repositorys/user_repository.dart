import 'package:sqflite/sqflite.dart';
import 'package:stepped_login/1-base/repositorys/base_repository.dart';

import '../models/user.dart';

class UserRepository extends BaseRepository{
  
  insertUser(User user) async{
    try{
      Database db = await getDataBase();    
      int? id = await db.insert("User", user.toJson());

      if(id != null){
        return true;
      }else{
        return false;
      }
    }catch(ex){
      print("ERRORINSERT :" + ex.toString());
    }
    
  }

  getUser() async{
    try{
      Database db = await getDataBase();
      String sql = "SELECT * FROM User LIMIT 1";
      var userMap = await db.rawQuery(sql);
      return User.fromJson(userMap.first); 
    }catch(ex){
      print("ERRORGET :" + ex.toString());
    }
       
  }

}
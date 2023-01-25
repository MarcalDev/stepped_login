import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseRepository{

  getDataBase() async{
    final dataBasePath = await getDatabasesPath();
    final localDataBase = join(dataBasePath, "database.db");

    var bd = await openDatabase(
      localDataBase,
      version: 1,
      onCreate: ((db, version) {
        String sql = "CREATE TABLE User (id Guid, name VARCHAR, email VARCHAR, phoneNumber VARCHAR, password VARCHAR, isActive boolean, realeaseDate VARCHAR)";
        db.execute(sql);
      })
    );
    return bd;
  }

}
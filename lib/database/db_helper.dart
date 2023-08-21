import 'dart:io';
import 'package:exercises/modal/user_modal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MYDB_Helper {
  var User_Table = "user";
  var User_Colum_Id = "uid";
  var User_Colum_Email = "email";
  var User_Colum_Password = "passwrod";

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();
    await mDirectory.create(recursive: true);

    var filePath = "$mDirectory/maindb.db";

    return await openDatabase(
      filePath,
      version: 1,
      onCreate: (db, version) {
        var CreateTableQuery =
            "Create table $User_Table ($User_Colum_Id Integer Primary Key Autoincrement, $User_Colum_Email text unique, $User_Colum_Password text)";
        db.execute(CreateTableQuery);
      },
    );
    /* 
     CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)
      */
  }

  Future<bool> createUser(UserModel userModal) async {
    var db = await openDB();
    if (await checkUserAlreadyExice(userModal.email)) {
      return false;
    } else {
      var check = await db.insert(User_Table, userModal.toMap());
      return check > 0;
    }
  }

  Future<bool> checkUserAlreadyExice(String email) async {
    var db = await openDB();
    var check = await db
        .query(User_Table, where: "$User_Colum_Email = ?", whereArgs: [email]);
    return check.isNotEmpty;
  }


  Future<bool> AuthenticateUser(
      {required String email, required String password}) async {
    var db = await openDB();
    var check = await db.query(User_Table,
        where: "$User_Colum_Email = ? and $User_Colum_Password = ?",
        whereArgs: [email, password]);
    return check.isNotEmpty;
  }
}

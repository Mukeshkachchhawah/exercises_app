import 'package:exercises/database/db_helper.dart';

class UserModel {
  int? uid;
  String email;
  String password;

  UserModel({required this.email, required this.password, this.uid});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map[MYDB_Helper().User_Colum_Id],
        email: map[MYDB_Helper().User_Colum_Email],
        password: map[MYDB_Helper().User_Colum_Password]);
  }

  Map<String, dynamic> toMap() {
    return {
       MYDB_Helper().User_Colum_Id: uid,
      MYDB_Helper().User_Colum_Email: email,
      MYDB_Helper().User_Colum_Password: password,
     
    };
  }
}

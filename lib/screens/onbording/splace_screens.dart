import 'dart:async';

import 'package:exercises/screens/home_screens/home_page.dart';
import 'package:exercises/screens/onbording/sign_in.dart';
import 'package:exercises/screens/onbording/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_account_page.dart';



class Splace_Screens extends StatefulWidget {
  const Splace_Screens({super.key});

  @override
  State<Splace_Screens> createState() => Splace_ScreensState();
}

class Splace_ScreensState extends State<Splace_Screens> {
  static const String UserKey = "LogInd";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sherdPerf();

  }

  void sherdPerf()async{
    var perf = await SharedPreferences.getInstance();

    var isLogin = perf.getBool(UserKey);

    Timer(Duration(milliseconds: 2000), () {
    if(isLogin!=null){
      if(isLogin){
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Page(),
          ));
      }
      else{
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ));
      }
    }else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sign_Up(),
          ));
    }
    });
    
  }

/* 
  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Account_Page(),
          ));
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Exercises",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}

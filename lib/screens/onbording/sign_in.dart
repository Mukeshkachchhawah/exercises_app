import 'package:exercises/database/db_helper.dart';
import 'package:exercises/screens/home_screens/home_page.dart';
import 'package:exercises/screens/onbording/sign_up.dart';
import 'package:exercises/screens/onbording/splace_screens.dart';
import 'package:exercises/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/top_to_bottom_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController emiolController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || !value!.contains("@")) {
                        return "Pleace Enter Valid Email";
                      } else {
                        /*  showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("Fild Data"),
                          );
                        },); */
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your Email",
                        prefixIcon: Icon(Icons.person_rounded),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" || value!.length < 6) {
                        return "Enter 6 digit password";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "enter your password",
                        prefixIcon: Icon(Icons.person_rounded),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buttonContiner(
                      text: "Sign In",
                      onTab: () async {
                        if (formkey.currentState!.validate()) {
                          var check = await MYDB_Helper().AuthenticateUser(
                              email: emiolController.text,
                              password: passwordController.text);
                          if (check) {
                            var perf = await SharedPreferences.getInstance();
                            perf.setBool(Splace_ScreensState.UserKey, true);
                            Navigator.of(context).push(PageAnimationTransition(
                                page: Home_Page(),
                                pageAnimationType: TopToBottomTransition()));
                          } else {
                            /// show errow
                          }
                        }
                      }),
                  hspacer(hight: 20),
                  SpDivider(),
                  hspacer(hight: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      socialContiner(
                        onTab: () {},
                        text: '',
                      ),
                      socialContiner(
                        onTab: () {},
                        text: '',
                      ),
                      socialContiner(
                        onTab: () {},
                        text: '',
                      ),
                    ],
                  ),
                  hspacer(hight: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("creat user new account?"),
                      Wspacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sign_Up(),
                              ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

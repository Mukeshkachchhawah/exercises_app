import 'package:exercises/database/db_helper.dart';
import 'package:exercises/modal/user_modal.dart';
import 'package:exercises/screens/onbording/sign_in.dart';
import 'package:exercises/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
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
                    "Sign Up",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                
                    validator: (value) {
                      if (value == "" || !value!.contains("@")) {
                        return "Pleace Enter Valid Email";
                      } else {}
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
                      text: "Sign Up",
                      onTab: () async {
                        if (formkey.currentState!.validate()) {
                          var check = await MYDB_Helper().createUser(UserModel(
                              email: emailController.text,
                              password: passwordController.text));

                          if (check) {
                            Navigator.of(context).push(PageAnimationTransition(
                                page: SignIn(),
                                pageAnimationType:
                                    LeftToRightFadedTransition()));
                          } else {
                            // show erro
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

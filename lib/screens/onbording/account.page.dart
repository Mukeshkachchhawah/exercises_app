import 'package:exercises/screens/onbording/sign_in.dart';
import 'package:exercises/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Create_Account extends StatelessWidget {
  const Create_Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage(
                    "https://assets.stickpng.com/images/61f7ccb667553f0004c53e67.png"))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 550, bottom: 50),
                      child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: buttonContiner(text: "Sign In", onTab: (){
                                  Navigator.of(context).push(PageAnimationTransition(page: SignIn(), pageAnimationType: LeftToRightFadedTransition()));
                                })),
                                SizedBox(
                                  width: 20,
                                ), SizedBox(
                                width: 150,
                                child: buttonContiner(text: "Sign Up", onTab: (){}))
                            ],
                          )
                        ],
                      ),
                    ),
      ),
    );
  }
}

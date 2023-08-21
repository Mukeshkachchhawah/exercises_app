import 'package:exercises/screens/onbording/account.page.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/top_to_bottom_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../ui_helper.dart';


class Home_Account_Page extends StatelessWidget {
  const Home_Account_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.infinity,
      width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/gym.jpg"),fit: BoxFit.cover)
        ),child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buttonContiner(onTab: () { 
             Navigator.of(context).push(PageAnimationTransition(page: Create_Account(), pageAnimationType: TopToBottomTransition(), ));
             }, text: 'Create Account',),
            SizedBox(
              height: 20,
            ),
           buttonContiner(onTab: () {  }, text: 'Check BMI',), 
           SizedBox(
            height: 20,
           )
          ],
        ),
      ),
    );
  }
}
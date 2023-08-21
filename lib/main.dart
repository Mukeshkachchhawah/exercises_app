import 'package:exercises/screens/onbording/splace_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercises App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const Splace_Screens(),
    );
  }
}
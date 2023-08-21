import 'package:flutter/material.dart';

class Social_Midia_Button extends StatelessWidget {
  String images;
  double scale_value;
  String textValue;
  Social_Midia_Button({required this.images, required this.scale_value, required this.textValue});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
         // image: DecorationImage(image: NetworkImage(images), scale: 50 ),
         ),
          child:   Image(image: NetworkImage(images, scale: scale_value)),
    );
  }
}
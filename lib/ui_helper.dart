import 'package:flutter/material.dart';

class buttonContiner extends StatelessWidget {
  String text;
  VoidCallback onTab;
  var hight = 50.0;
  var widget = 380.0;
  buttonContiner({required this.text, required this.onTab});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTab,
      child: Container(
        height: hight,
        width: widget,
        decoration: BoxDecoration(color: Colors.red,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

Widget hspacer({double hight = 12.0}){
  return SizedBox(
    height: hight,
  );
}
Widget Wspacer({double width = 12.0}){
  return SizedBox(
    width: width,
  );
}

Widget SpDivider(){
  return Row(
    children: [
      Container(
        height: 1,
        width: 155,
        color: Colors.black,
      ),
      Wspacer(),
      Text("or", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),), Wspacer(),
      Container(
        height: 1,
        width: 155,
        color: Colors.black,
      )
    ],
  );
}

class socialContiner extends StatelessWidget {
  String text;
  VoidCallback onTab;
  var hight = 50.0;
  var widget = 100.0;
  socialContiner({required this.text, required this.onTab});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTab,
      child: Container(
        height: hight,
        width: widget,
        decoration: BoxDecoration(border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

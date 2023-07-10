import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class pageViewItem extends StatelessWidget{
  String? title,subtitle,image;
  pageViewItem({ required this.image,required this.title,required this.subtitle});
  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
       SizedBox(height: MediaQuery.of(context).size.height *.2,),
      SizedBox(height: 250,
          child: Image.asset(image!)),
      SizedBox(height:10,),
      Text(title!,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF253036),
      ),
        textAlign: TextAlign.center,
      ),
        SizedBox(height: 10,),
      Text(subtitle!,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black38,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
  }
}
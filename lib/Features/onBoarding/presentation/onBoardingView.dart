import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/onBoardingBody.dart';

class onBoardingView extends StatelessWidget{
  static String id = 'onBoardingView';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFFF5F5F5),
     body: onBoardingBody(),
   );
  }

}
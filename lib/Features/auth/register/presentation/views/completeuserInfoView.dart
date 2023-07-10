import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/completeUserInfoBody.dart';

class completeUserInfoView extends StatelessWidget{
  static String id = 'completeUserInfoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KMainColor,
      body: completeUserInfoBody(),
    );


  }


}
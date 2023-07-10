import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/registerBody.dart';
import 'package:yap_chat_app/constants.dart';

class registerView extends StatelessWidget{
 static String id = 'registerView';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // backgroundColor: KMainColor,
     body: registerBody(),
   );


  }

}
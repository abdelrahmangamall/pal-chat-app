import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/login/presentation/views/widgets/loginBody.dart';

class loginView extends StatelessWidget{
  static String id = 'loginView';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: loginBody(),
   );
  }

}
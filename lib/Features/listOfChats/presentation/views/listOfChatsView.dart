import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/registerBody.dart';
import 'package:yap_chat_app/Features/listOfChats/presentation/views/widgets/listOfChatsBody.dart';
import 'package:yap_chat_app/constants.dart';
import 'package:yap_chat_app/core/utils/message.dart';
class listOfChatsView extends StatelessWidget{
  static String id = 'listOfChatsView';
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    // backgroundColor:Colors.black26,
     appBar: AppBar(

       automaticallyImplyLeading: false,
       backgroundColor:KMainColor,

       title: Text('MY CONTACTS',textAlign: TextAlign.center,),
     ),
   body: listOfChatsBody(),
  );
  }
}
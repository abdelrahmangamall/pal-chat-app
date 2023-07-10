import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/chats/presentation/views/widgets/chatBody.dart';
import 'package:yap_chat_app/constants.dart';
import '../../../../core/utils/message.dart';

class chatView extends StatelessWidget{
  @override
   userLoginResponseEntity? us;
  static String id = 'chatView';
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: Text(
        ' us!.displayName',
        ),
      ),
      body: chatBody(),
    );
  }
}
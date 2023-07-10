import 'package:flutter/material.dart';
import 'package:yap_chat_app/core/utils/message.dart';
import '../../constants.dart';

class chatBuble extends StatelessWidget {

 Message text;

   chatBuble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerRight,
      child: Container(

        padding:EdgeInsets.all(16) ,
        margin: EdgeInsets.all(8),

        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
          color:Colors.black26,
        ) ,
        child: Text(text.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),

        ),
      ),
    );
  }


}



class secChatBuble extends StatelessWidget {

  Message text;


  secChatBuble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        padding:EdgeInsets.all(16) ,
        margin: EdgeInsets.all(8),

        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30),bottomRight: Radius.circular(30),),
          color:Colors.black12,
        ) ,
        child: Text(text.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),

        ),
      ),
    );
  }


}
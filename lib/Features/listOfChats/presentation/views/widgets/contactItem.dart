import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/chats/presentation/views/chatView.dart';
import '../../../../../core/utils/message.dart';

class contactItem extends StatelessWidget{
  String? userName = '';
  String? message = '';
  String? imageUrl ;
  final userLoginResponseEntity? user;
  final Message? ms;
  contactItem({ this.userName, this.message,
     this.imageUrl,  this.user,  this.ms});

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context,
          MaterialPageRoute (builder: (context) => chatView()) );


    },
    child: Padding(
      padding: EdgeInsets.only(left:10 ),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           SizedBox(
               height: 100,
               width: 60,
               child: CircleAvatar(
                 radius: 100,
                 backgroundImage: FileImage(File(user!.photoUrl)) ,
               )),
            SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user!.displayName,
              style: TextStyle(
                fontSize: 20,
              ),),
              SizedBox(height: 5,),
              Text('${ms?.text}' ,style: TextStyle(),maxLines: 1,),
            ],
          ),
        ],
      ),
    ),
  );
  }

}
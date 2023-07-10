import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/profilePhoto.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/customTextField.dart';

class completeUserInfoBody extends StatelessWidget{
  @override

//  CollectionReference usersInfo =
//  FirebaseFirestore.instance.collection(KUsers);

  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: Column(
         children: [
           profilePhoto(),
           customTextField(
             hintText: 'Enter your Name',
             onChanged: (data) {
              ' registerBody.userInfo?.displayName = data';},
           ),
           customTextField(
             hintText: 'Write Your Bio',
             onChanged: (data) {
               ' registerBody.userInfo?.displayName = data';},
           ),
         ],
       ),
     ),
   );
  }
}
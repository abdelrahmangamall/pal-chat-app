import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/registerBody.dart';
import 'package:yap_chat_app/Features/listOfChats/presentation/views/widgets/contactItem.dart';
import '../../../../../core/utils/message.dart';

class listOfChatsBody extends StatelessWidget{

  List<userLoginResponseEntity> usersInfoList = [];
  Widget build(BuildContext context) {

   return StreamBuilder<QuerySnapshot> (
         stream: registerBody.usersInfo.snapshots(),
          builder: ( context,snapshot) {
        if(snapshot.hasData) {
          final data = snapshot.data?.docs;
       //   for (int i = 0; i < snapshot.data!.docs.length; i++) {
           // usersInfoList.add(userLoginResponseEntity.fromJson(snapshot.data!.docs[]));
              //  log('Data : ${usersInfoList}');
          usersInfoList = data?.map((e) => userLoginResponseEntity.fromJson(e.data())).toList() ?? [];
        //  }
          return ListView.builder(
            itemCount: usersInfoList.length,
            itemBuilder: ( context, index) {
            return contactItem(user:usersInfoList[index]);
            },

          );
        }  else{
          return Text('no Contacts Found');
        }
        },
     );

  }

}
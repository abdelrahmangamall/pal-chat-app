import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/login/presentation/views/widgets/loginBody.dart';
import 'package:yap_chat_app/constants.dart';
import 'package:yap_chat_app/core/utils/chatBuble.dart';
import 'package:yap_chat_app/core/utils/customTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yap_chat_app/core/utils/message.dart';

class chatBody extends StatelessWidget{
  @override

   CollectionReference messages =
  FirebaseFirestore.instance.collection(KMessgesCollections)
    //  .where('senderId', whereIn: ['user1', 'user2'])
    //  .where('recipientId', whereIn: ['user1', 'user2'])
    //  .orderBy(KCreatedAt, descending: true)
    //  .snapshots() as CollectionReference<Object?>
      ;

 // FirebaseFirestore.instance
 //     .collection('users')
    //  .limit(2)
   //   .get()
   //   .then(...);

  final controler = ScrollController();



  TextEditingController controller = TextEditingController();
  Widget build( context) {
   // var Email = ModalRoute.of(context)!.settings.arguments;
   return StreamBuilder<QuerySnapshot>(
       stream: messages.orderBy(KCreatedAt,descending: true).snapshots(),
       builder: (context,snapshot) {
         if(snapshot.hasData){
           List<Message> messagesList =[];
           for(int i=0 ; i <snapshot.data!.docs.length;i++){
             messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
           }

           return Container(
             padding: EdgeInsets.only(top: 5),
             child: Column(
               children: [
                 Expanded(
                   child: ListView.builder(
                     reverse: true,
                     controller: controler,
                     itemCount: messagesList.length,
                     itemBuilder: ( context, index) {
                       return messagesList[index].id == loginBody.email ?
                           chatBuble(text: messagesList[index])
                           : secChatBuble(text: messagesList[index]);
                     },
                   ),
                 ),
                 customTextField(
                   hintText: 'Send Message',
                   onSubmitted: (data) {
                     messages.add({
                       KText:data,
                       KCreatedAt:DateTime.now(),
                       'id':loginBody.email,
                    //    KUserName : registerBody.userInfo?.displayName,
                      // 'photoUrl' : profilePhotoState.image,
                     });
                     controller.clear();
                     controler.jumpTo(0,);
                   },
                   controller: controller,
                 ),

               ],
             ),


           );
         }
         else{
          return Text('LOADING..');
         }
       },);
  }

}
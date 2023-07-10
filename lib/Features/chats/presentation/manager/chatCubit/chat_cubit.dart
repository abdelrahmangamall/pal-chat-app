import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:yap_chat_app/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages = FirebaseFirestore.instance.collection(KMessgesCollections);

  void sendMessages ({String? message}){
    try {
      messages.add({
        'text':message,
        //'email':loginBody.email!,
      });
    } on Exception catch (e) {
       print (e);
    }

  }


}

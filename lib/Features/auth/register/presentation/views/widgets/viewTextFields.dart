import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/profilePhoto.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/registerBody.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/customTextField.dart';

class viewTextFields extends StatelessWidget{
 static String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 350,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          customTextField(
            hintText: 'Enter your Name',
            onChanged: (data) {
              name = data;},

          ),
          customTextField(
            hintText: 'Enter your Email',
            onChanged: (data) {
              registerBody.email = data;
            },
          ),
          customTextField(
            hintText: 'Enter your password',
            onChanged: (data) {
              registerBody.password = data;
            },
          ),
          customTextField(
            hintText: 'Confirm your password',
            onChanged: (data) {
              registerBody.password = data;
            },
          ),
        ],
      ),
    );
  }

}
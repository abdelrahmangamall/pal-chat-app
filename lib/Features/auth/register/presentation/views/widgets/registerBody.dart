import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/profilePhoto.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/widgets/viewTextFields.dart';
import 'package:yap_chat_app/constants.dart';
import 'package:yap_chat_app/core/utils/customButton.dart';
import 'package:yap_chat_app/core/utils/message.dart';
import '../../../../../../core/utils/showSnakeBar.dart';
import '../../../../login/presentation/views/loginView.dart';
import '../../../../manager/authCubit/auth_cubit.dart';



class registerBody extends StatelessWidget {
 static CollectionReference usersInfo =
  FirebaseFirestore.instance.collection(KUsers);
 static String email = '', password = '';
   bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener:(context,state){
        if(state is RegisterLoading){
          isLoading= true;
        }else if(state is RegisterSuccess){
          isLoading= false;
          Navigator.pushNamed(context, loginView.id);
          showSnackBar(context, 'register success');
        }else if(state is RegisterFailure){
         showSnackBar(context, state.errorMassage);
         isLoading= false;

        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  profilePhoto(),
                  SizedBox(
                    height: 20,
                  ),
                  viewTextFields(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: customBotton(
                      name: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await  BlocProvider.of<RegisterCubit>(context)
                              .registerUser(
                              email: email, password: password,
                             // userName: userInfo?.displayName ,
                             // imageUrl: userInfo?.photoUrl
                          );
                        usersInfo.add({
                           'Email' : email,
                        KUserName : viewTextFields.name,
                         'photoUrl': profilePhotoState.image,
                       });

                                         } else {
                        }
                      },
                      color: KMainColor,
                    ),
                    //  Navigator.push(context,
                    //  MaterialPageRoute(builder: (context) =>  loginView()),);
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

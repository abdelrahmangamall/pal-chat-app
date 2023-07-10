import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yap_chat_app/Features/auth/manager/authCubit/auth_cubit.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/registerView.dart';
import 'package:yap_chat_app/Features/chats/presentation/views/chatView.dart';
import 'package:yap_chat_app/Features/chats/presentation/views/widgets/chatBody.dart';
import 'package:yap_chat_app/Features/listOfChats/presentation/views/listOfChatsView.dart';
import 'package:yap_chat_app/constants.dart';
import '../../../../../../core/utils/customButton.dart';
import '../../../../../../core/utils/customTextField.dart';
import '../../../../../../core/utils/showSnakeBar.dart';


class loginBody extends StatelessWidget{
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
 static String email = '', password = '';

  @override
  Widget build(BuildContext context) {
  return BlocConsumer<LoginCubit,LoginState>(
    listener: ( context, state) {
      if(state is LoginLoading){
        isLoading= true;
      }else if(state is LoginSuccess){
        Navigator.pushNamed(context, listOfChatsView.id);
        isLoading= false;
        showSnackBar(context, 'login success');
      }else if(state is LoginFailure){
        showSnackBar(context, state.errorMassage);
        isLoading= false;
      }
    },
    builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: formKey ,
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
            child: ListView(
              children: [
               // SizedBox(height: MediaQuery.of(context).size.height * .1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.chat_outlined,size: 70,color: KMainColor,),
                    Text('PAL',style: TextStyle(
                        fontSize: 70,
                        color: KMainColor
                    ),),
                  ],
                ),

                customTextField(hintText: 'Enter your Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                customTextField(hintText: 'Enter your password',
                  onChanged: (data) {
                    password = data;
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55,vertical: 30),
                  child: customBotton(onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await  BlocProvider.of<LoginCubit>(context)
                          .loginUser(
                          email: email, password: password);
                    } else {
                          showSnackBar(context, 'there was an error');
                    }
                  }, name: 'Login', color: KMainColor),

                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account?',),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, registerView.id);
                      },
                      child: Text('Register',),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text('OR',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38
                ),
                textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
  }

}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

     Future<void>   registerUser(
         {required String email,required String password,
            String? userName, String? imageUrl})
     async{

       try {
         emit(RegisterLoading(),);

         UserCredential user = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: email, password: password);


        await user.user?.updateDisplayName(userName);
       await  user.user?.updatePhotoURL(imageUrl);
         emit(RegisterSuccess(),);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
            emit(RegisterFailure(errorMassage: 'weak-password'));
            } else if (e.code == 'email-already-in-use') {
              emit(RegisterFailure(errorMassage: 'email-already-in-use'));
            }
            emit(RegisterFailure(errorMassage: '${e.code.toString()}' ));
          }

//if(user != null){
       //  String? displayName = user.user!.displayName ?? user.user!.email;
       //  String? email = user.user!.email;
       //  String? id = user.user!.uid;
       //  String? photoUrl = user.user!.photoURL;
       //  userLoginResponseEntity userProfile = userLoginResponseEntity() ;

       ////  userProfile.email = email;
       //  userProfile.photoUrl=photoUrl;
       //  userProfile.displayName=displayName;
       //  userProfile.accessToken=id;
       // }

  }
}





class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void>   loginUser(
      {required String email,required String password, String? userName,String? imageUrl})
  async{
    try {
      emit(LoginLoading(),);
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      emit(LoginSuccess(),);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMassage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMassage: 'wrong-password'));
      }
        emit(LoginFailure(errorMassage: '${e.code.toString()}'));
    }
  }
}
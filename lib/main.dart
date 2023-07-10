import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yap_chat_app/Features/auth/login/presentation/views/loginView.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/completeuserInfoView.dart';
import 'package:yap_chat_app/Features/auth/register/presentation/views/registerView.dart';
import 'package:yap_chat_app/Features/chats/presentation/views/chatView.dart';
import 'package:yap_chat_app/Features/listOfChats/presentation/views/listOfChatsView.dart';
import 'package:yap_chat_app/Features/onBoarding/presentation/onBoardingView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/auth/manager/authCubit/auth_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(YappChatApp());
}

class YappChatApp extends StatelessWidget {
  YappChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context) => RegisterCubit()),
       BlocProvider(create: (context) => LoginCubit()),
     ],
      child: MaterialApp(
        routes: {
          loginView.id :(context) => loginView(),
          registerView.id :(context) => registerView(),
          onBoardingView.id :(context) => onBoardingView(),
          chatView.id :(context) => chatView(),
          listOfChatsView.id :(context) => listOfChatsView(),
          completeUserInfoView.id : (context) => completeUserInfoView(),
        },
        initialRoute: onBoardingView.id,
        debugShowCheckedModeBanner: false,
        home: onBoardingView(),
      ),
    );
  }
}

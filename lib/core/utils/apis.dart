import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yap_chat_app/Features/listOfChats/presentation/views/widgets/listOfChatsBody.dart';

class apis {

  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User? get user => auth.currentUser;

  static Future<bool>  userExists()  async {
    return (await firestore.collection('users').doc(user?.uid).get()).exists;
  }
  static Future<void> createUser() async{
    final time = DateTime.now().microsecond.toString();
    final chatUser = listOfChatsBody(
      //  id: user!.uid,
     //   name: user!.displayName.toString(),
     //   email: user!.email.toString(),
    //    about: 'about',
     //   image: user!.photoURL.toString(),
    );
  }
}
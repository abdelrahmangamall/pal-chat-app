import 'package:flutter/cupertino.dart';
import 'package:yap_chat_app/Features/onBoarding/presentation/widgets/pageViewItem.dart';

class customPageView extends StatelessWidget{
  @override
  final  PageController? pageController;

  const customPageView({super.key, @required this.pageController});
  Widget build(BuildContext context) {
   return PageView(
     controller: pageController,
     children:[
       pageViewItem(
         image: 'assets/images/Messaging fun-rafiki.png',
         title: 'PAL',
         subtitle: 'Supported and up-to-date chat app to chat with friends,'
             'discuss business meetings, etc., enjoy the app experience'),
       pageViewItem(
         image:  'assets/images/Messaging fun-rafiki.png',
         title: 'Send Message',
         subtitle: ' message your friends and those you love on the latest chat apps'),
       pageViewItem(
         image:  'assets/images/Messaging fun-rafiki.png',
         title: 'Create Free Account',
         subtitle: 'Sign In with Google To quickly log in and not waste your time'),
     ]
   );
  }

}
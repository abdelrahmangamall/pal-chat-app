import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/Features/auth/login/presentation/views/loginView.dart';
import 'package:yap_chat_app/constants.dart';
import '../../../../core/utils/customButton.dart';
import '../../../auth/register/presentation/views/registerView.dart';
import 'customInicator.dart';

import 'customPageView.dart';

class onBoardingBody extends StatefulWidget{

  @override
  State<onBoardingBody> createState() => _onBoardingBodyState();
}

class _onBoardingBodyState extends State<onBoardingBody> {
  PageController? pageController;
  @override
  void initState(){
    pageController=PageController(initialPage: 0)..addListener(() {
      setState(() {
      });
    });
        super.initState();
  }
  Widget build(BuildContext context) {
    double n =  pageController!.hasClients ? pageController!.page as double : 0;
   // dynamic n =  pageController?.hasClients ?? false ? pageController!.page : 0;
    return Stack(
    children: [
      customPageView(pageController: pageController,),
      Visibility(
        visible: n == 2 ? false : true ,
        child: Positioned(
            top: MediaQuery.of(context).size.height *0.13 ,
            right: 40,
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ) ,
              onPressed: () {
                pageController?.jumpToPage(2);
              },
              child:const Text('Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF253036),
                ),),
            ),
        ),
      ),     //skip

   // customPageView(pageController: pageController,),
      customIndicator(points: n.toInt()),
      Positioned(
          left: 30,
          right: 30,
          bottom:MediaQuery.of(context).size.height *.2,
          child:
       customBotton(onTap: (){  if(n == 2){
         Navigator.push(context,
           MaterialPageRoute(builder: (context) =>  loginView()),);

       }else{
         pageController?.nextPage(duration: Duration(milliseconds: 10),
             curve: Curves.easeIn);
       }
       },
         name: n == 2 ? 'Get Start' : 'Next', color: KMainColor,)), //nextButton
    ],
  );

  }

}
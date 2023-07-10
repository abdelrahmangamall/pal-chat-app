import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yap_chat_app/constants.dart';

class customTextField extends StatelessWidget{
  @override
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final Function(String)? onChanged;
  final int? maxLines;
  final String hintText;
  void Function(String)? onSubmitted;
  void Function()? onTap;
   TextEditingController? controller ;
   customTextField({super.key,
    this.inputType,
    this.suffexIcon, this.onSaved,
    this.onChanged, this.maxLines, required this.hintText,
    this.onSubmitted,this.controller, this.onTap});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: TextField(
      // keyboardType:inputType ,
       onChanged: onChanged,
       //onSaved: onSaved,
       // maxLines:maxLines ,
         onSubmitted: onSubmitted ,
        controller: controller,
        onTap:onTap ,
        style: TextStyle(

        ),
        decoration: InputDecoration(
          suffixIcon: suffexIcon,
          hintText: hintText,
          filled: true,
         fillColor: Colors.transparent,
         // hoverColor: Colors.white,
          focusColor: KMainColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

}
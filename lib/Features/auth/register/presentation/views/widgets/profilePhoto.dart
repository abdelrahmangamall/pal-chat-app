import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/importPhoto.dart';


class profilePhoto extends StatefulWidget{
  @override

  State<profilePhoto> createState() => profilePhotoState();

}

class profilePhotoState extends State<profilePhoto> {

   static  String image = '';

  @override
  Widget build(BuildContext context) {


  return  Column(
    children: [
      image == ''
          ? CircleAvatar(
            radius: 100,
            backgroundImage:
            AssetImage('assets/images/istockphoto-522855255-612x612.jpg',),
          )
          : CircleAvatar(
            radius: 100,
            backgroundImage: FileImage(File(image),),
          ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Select your Photo ',style: TextStyle(
                   color: Colors.black26,
                 ),),
                 IconButton(onPressed: (){
                       selectImage();
                        setState(() {

                        });
                 }, icon:Icon(Icons.add_a_photo)),
               ],
             )
    ],
  );
 }
   Future selectImage() {
     return showDialog(
         context: context,
         builder: (BuildContext context) {
           return Dialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0)), //this right here
             child: Container(
               height: 150,
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Column(
                   children: [
                     Text(
                       'Select Photo From !',
                       style: TextStyle(
                           fontSize: 18.0, fontWeight: FontWeight.bold),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         GestureDetector(
                           onTap: () async {
                            image = await selectImageFromGallery();
                             print('Image_Path:-');
                             print(image);
                             if (image != '') {
                               Navigator.pop(context);
                               setState(() {});
                             } else {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text("No Image Selected !"),
                               ));
                             }
                           },
                           child: Card(
                               elevation: 5,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   children: [
                                     Image.asset(
                                       'assets/images/gallery.png',
                                       height: 60,
                                       width: 60,
                                     ),
                                     Text('Gallery'),
                                   ],
                                 ),
                               )),
                         ),
                         GestureDetector(
                           onTap: () async {
                             image = await selectImageFromCamera();
                             print('Image_Path:-');
                             print(image);

                             if (image != '') {
                               Navigator.pop(context);
                               setState(() {});
                             } else {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text("No Image Captured !"),
                               ));
                             }
                           },
                           child: Card(
                               elevation: 5,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   children: [
                                     Image.asset(
                                       'assets/images/camera.png',
                                       height: 60,
                                       width: 60,
                                     ),
                                     Text('Camera'),
                                   ],
                                 ),
                               )),
                         ),
                       ],
                     )
                   ],
                 ),
               ),

             ),
           );
         });

   }


}

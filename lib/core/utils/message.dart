import '../../constants.dart';

class Message {
  final String text;
  final String id;
 // final String userName;
// final String photoUrl;

  Message(this.text, this.id,
    //  this.userName, this.photoUrl
      );
  factory Message.fromJson(jsonData){
    return Message(jsonData[KText],jsonData['id'],
//        jsonData['userName'],jsonData['photoUrl']
    );
  }
}


class userLoginResponseEntity{
 late final String displayName;
 late final String? Email;
 late final String photoUrl ;

 // final String? accessToken;

  userLoginResponseEntity(
      {required this.displayName,
        required this.Email,
        required this.photoUrl,
     //   this.accessToken
      });

  factory userLoginResponseEntity.fromJson(jsonData) {
    return  userLoginResponseEntity(
      displayName: jsonData["displayName"] ?? '',
      Email: jsonData["Email"] ?? '',
      photoUrl: jsonData["photoUrl"] ?? '',
     // accessToken: jsonData["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
  //  "access_token" : accessToken,
    "displayName": displayName,
    "photoUrl":photoUrl,
    "Email" : Email,

  };
}
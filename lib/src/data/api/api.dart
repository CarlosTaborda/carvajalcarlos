import 'package:get/get.dart';
import 'package:carvajalcarlos/src/data/models/user_model.dart';
import 'dart:developer';


class Api extends GetConnect{

  final url ="https://google.com";
     
  Future<UserModel> login(UserModel u) async{
    //Response res = await post(url, u.toMap());
    log(u.toString());
    return u;
  }


  Future<UserModel> createUser(UserModel u) async{
    //Response res = await post(url, u.toMap());
    log(u.toString());
    return u;
  }

}
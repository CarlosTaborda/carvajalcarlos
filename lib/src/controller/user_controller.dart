
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carvajalcarlos/src/data/api/api.dart';
import 'package:carvajalcarlos/src/data/models/user_model.dart';



class UserController extends GetxController{
  final formLoginKey = GlobalKey<FormState>();
  final formSiginKey = GlobalKey<FormState>();
  final api = Api();

  // user login
  UserModel? userLogin = UserModel.empty();

  // user register
  UserModel userRegister = UserModel.empty();


  void loginUser(){
    api.login(userLogin!);
  }

  void createUser(){
    api.createUser(userRegister);
  }

  

}
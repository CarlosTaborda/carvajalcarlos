import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carvajalcarlos/src/controller/all_controllers.dart';

import 'package:carvajalcarlos/src/views/login_view.dart';
import 'package:carvajalcarlos/src/views/products_view.dart';
import 'package:carvajalcarlos/src/views/sigin_view.dart';
import 'package:carvajalcarlos/src/views/themeapp.dart';



void main() {

  Get.lazyPut<UserController>(()=>UserController());
  Get.lazyPut<ProductController>(()=>ProductController());


  runApp(
    GetMaterialApp( 
      theme: myTheme,
      getPages: [
        GetPage(name:"/",page: ()=>const LoginView()),
        GetPage(name:"/sigin",page: ()=>const SiginView()),
        GetPage(name:"/products",page: ()=> const ProductsView()),

      ],
    )
  );
}

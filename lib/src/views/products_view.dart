import 'package:carvajalcarlos/src/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsView extends GetView<ProductController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Nuestros Productos"),
        centerTitle: true,
      ),
      body: Placeholder(),
    );
  }
}
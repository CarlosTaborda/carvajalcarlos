
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_validator/form_validator.dart';
import 'package:carvajalcarlos/src/controller/user_controller.dart';

class LoginView extends GetView<UserController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }


  ListView _body(){
    return ListView(
      children: [
        _imgBanner(),
        _form(),
        _register()
      ],
    );
  }


  Container _form(){
    return Container(
      child: Form(
        key: controller.formLoginKey,
        child: Column(
          children: [
            
            _title(),
            _emailField(),
            _passwordField(),
            _loginBtn()
          ],
        ),
      ),
    );
  }

  Container _title(){
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Inicio de sesión", style: Get.textTheme.headline3),
      ),
    );
  }

  SizedBox _imgBanner(){

    return SizedBox(
      height: Get.height * 0.30,
      child: Image.asset("assets/app-banner.png", fit: BoxFit.fill,)
    );
  }


  Container _emailField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        onChanged: (email){
          controller.userLogin!.email = email;
          controller.update();
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: "Correo eléctronico"
        ),
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "El correo electrónico es necesario")
                              .email("El correo electrónico no es correcto")
                              .maxLength(50,"El correo electrónico es demasiado largo")
                              .build();
          return validator(value??"");
        }
      ),
    );
  }

  Container _passwordField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          hintText: "Contraseña",
          
        ),
        onChanged: (password){
          controller.userLogin!.password = password;
          controller.update();
        },
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "La contraseña es necesaria")
                    .required()
                    .minLength(5,"Debe contener al menos 5 caracteres")
                    .maxLength(20, "Debe tener máximo 20 caracteres")
                    .build();
          return validator(value??"");
        }
      ),
    );
  }

  ElevatedButton _loginBtn(){
    
    return ElevatedButton(
      child:  SizedBox(
        width: Get.width-80,
        child: Center(
          child: Text("Inicia sesion".toUpperCase(),style: Get.textTheme.headline2,),
        )
      ),
      onPressed: (){
        if( controller.formLoginKey.currentState!.validate() ){
          controller.loginUser();
        }

      },
    );
  }


  Center _register(){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No te has registrado,"),
          TextButton(
            onPressed: ()=>Get.toNamed("/sigin"), 
            child: const Text("Registrate")
          )
        ],
      )
    );
  }
}
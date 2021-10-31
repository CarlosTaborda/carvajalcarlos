
import 'dart:developer';

import 'package:carvajalcarlos/src/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_validator/form_validator.dart';
import 'package:carvajalcarlos/src/controller/user_controller.dart';
class SiginView extends GetView<UserController> {
  const SiginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrate"),
        centerTitle: true,
      ),
      body: _body()
    );
  }

  ListView _body(){
    return ListView(
      children: [
        SizedBox(height: Get.height*0.05,),
        _form()
      ],
    );
  }

  Container _form(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), 
      child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(15),
        elevation: 10,
        child:Form(
          key: controller.formSiginKey,
          child: Column(
            children: [
              _title(),
              _firstNameField(),
              _lastNameField(),
              _emailField(),
              _addressField(),
              _genderField(),
              _passwordField(),
              _passwordConfirmField(),
              _registerButton(),
              
            ],
          ),
        ),
      )
    );
  }

  Container _title(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Registra tus datos",
          style: Get.textTheme.headline3,
        ),
      ),
    );
  }

  Container _firstNameField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.name,
        initialValue: controller.userRegister.firstname,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: "Nombres"
        ),
        onChanged: (firstname){
          controller.userRegister.firstname = firstname;
          controller.update();
        },
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "El nombre es necesario")
                              .regExp(RegExp(r"[\D\s]+",caseSensitive:false), "No es un nombre válido")
                              .maxLength(30,"El nombre es demasiado largo")
                              .build();
          return validator(value??"");
        }
      ),
    );
  }

  Container _lastNameField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: controller.userRegister.lastname,
        decoration: const InputDecoration(
          icon: Icon(Icons.person_outline),
          hintText: "Apellidos"
        ),
        onChanged: (lastname){
          controller.userRegister.lastname = lastname;
          controller.update();
        },
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "El apellido es necesario")
                              .regExp(RegExp(r"[\D\s]+"), "No es un apellido válido")
                              .maxLength(30,"El apellido es demasiado largo")
                              .build();
          return validator(value??"");
        }
      ),
    );
  }

  Container _emailField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: controller.userRegister.email,
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: "Correo eléctronico"
        ),
        onChanged: (email){
          controller.userRegister.email = email;
          controller.update();
        },
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

  Container _addressField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        initialValue: controller.userRegister.address,
        keyboardType: TextInputType.streetAddress,
        decoration: const InputDecoration(
          icon: Icon(Icons.location_on),
          hintText: "Dirección"
        ),
        onChanged: (address){
          controller.userRegister.address = address;
          controller.update();
        },
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "La dirección es necesaria")
                              .maxLength(50,"La dirección es demasiado larga")
                              .build();
          return validator(value??"");
        }
      ),
    );
  }

  Container _genderField(){
    return Container(
      
      width: Get.width,
      child: GetBuilder<UserController>(builder: (_c)=>Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25), 
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Género"),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: RadioListTile<Gender>(
                  dense: true,
                  value: Gender.male, 
                  groupValue: _c.userRegister.gender, 
                  onChanged: (Gender? value ){
                    _c.userRegister.gender=value??Gender.male;
                    
                    _c.update();
                  },
                  title: Row(children: const [
                    Icon(Icons.male),
                    Text("Masculino")
                  ],),
                ),
              ),
              Expanded(
                flex: 1,
                child: RadioListTile<Gender>(
                  dense: true,
                  value: Gender.female, 
                  groupValue: _c.userRegister.gender, 
                  onChanged: (Gender? value ){
                    _c.userRegister.gender=value??Gender.female;
                    _c.update();
                  },
                  title: Row(children: const [
                    Icon(Icons.male),
                    Text("Femenino")
                  ],),
                ),
                
              ),
              
              
            ],
          )
        ],
      ))
    );
  }

  Container _passwordField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          hintText: "Contraseña"
        ),
        obscureText: true,
        onChanged: (password){
          controller.userRegister.password = password;
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

  Container _passwordConfirmField(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          hintText: "Confirme la contraseña"
        ),
        onChanged: (passwordconfirm){
          controller.userRegister.passwordconfirm = passwordconfirm;
          controller.update();
        },
        validator: (value){
          final validator = ValidationBuilder(requiredMessage: "La contraseña es necesaria")
                              .required()
                              .minLength(5,"Debe contener al menos 5 caracteres")
                              .maxLength(20, "Debe tener máximo 20 caracteres")
                              .build();

          if( controller.userRegister.password != controller.userRegister.passwordconfirm  ){
            return "Las contraseñas no coinciden";
          }
            
          return validator(value??"");
        }
      ),
    );
  }

  

  Container _registerButton(){
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: ElevatedButton(
        child:  SizedBox(
          width: Get.width-80,
          child: Center(
            child: Text("Registrate".toUpperCase(),style: Get.textTheme.headline2,),
          )
        ),
        onPressed: (){
          if( controller.formSiginKey.currentState!.validate() ){
            controller.createUser();
          }
        },
      ),
    );
  }
}
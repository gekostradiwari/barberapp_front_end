import 'package:barberapp_front_end/color_schemes.g.dart';
import 'package:barberapp_front_end/Model/getImages.dart';
import 'dart:core';
import 'package:flutter/material.dart';

class SignupUser extends StatefulWidget{
  const SignupUser({super.key});
  @override
  State<SignupUser> createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser>{
  static const InputDecoration _fieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
  );

  static const EdgeInsets _filePadding =
      EdgeInsets.symmetric(horizontal: 32, vertical: 0);
  late TextEditingController _usernameController;
  late TextEditingController _pwdController;
  late TextEditingController _nameController;
  late TextEditingController _surnameController;

  @override
  void initState(){
    _usernameController = TextEditingController();
    _pwdController = TextEditingController();
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Registra il tuo account'),
          ],
        ),
      )
    );
  }

}
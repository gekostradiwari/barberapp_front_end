import 'dart:core';
import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:barberapp_front_end/Model/getImages.dart';
import 'package:barberapp_front_end/Providers/UserDataProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../Model/Cliente.dart';
import '../Retrofit/RetrofitService.dart';
import 'package:barberapp_front_end/RouteGenerator.dart';

class ProfiloUtente extends StatefulWidget {
  const ProfiloUtente({super.key});

  @override
  State<ProfiloUtente> createState() => _ProfiloUtenteState();
}

class _ProfiloUtenteState extends State<ProfiloUtente> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Profilo',
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: CircleAvatar(
                  backgroundColor: Color(0x3FA4A9AE),
                  child: PopupMenuButton<int>(
                    onSelected: (int value){
                      if(value == 1){
                        Navigator.pushNamed(context, '/login_page');
                      }
                      else if (value == 2) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  '${Provider.of<UserDataProvider>(context, listen: false).cliente.nome} ${Provider.of<UserDataProvider>(context, listen: false).cliente.cognome}'),
                              content: Text('Cancella account'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    final retrofitService = RetrofitService(Dio(
                                        BaseOptions(
                                            contentType: "application/json")));
                                    retrofitService.deleteCliente(
                                        Provider.of<UserDataProvider>(context,
                                            listen: false)
                                            .cliente);
                                        (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        Navigator.pushNamed(context,
                                            '/login_page'); // Chiudi il popup
                                      } else {
                                        Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    };
                                  },
                                  child: Text('SI'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Chiudi il popup
                                  },
                                  child: Text('NO'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                     const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Log out',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Cancella account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                    ],
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Image.asset(GetImages.images["avatar"]!),
                  Text(
                    Provider.of<UserDataProvider>(context, listen: true)
                        .cliente
                        .nome,
                    style: const TextStyle(
                      color: Color(0xFF23303B),
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  FormBuilder(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, top: 6),
                              width: 316,
                              height: 63,
                              decoration: ShapeDecoration(
                                color: Color(0x26A4A9AE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: FormBuilderTextField(
                                name: 'nome',
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                initialValue: Provider.of<UserDataProvider>(
                                        context,
                                        listen: true)
                                    .cliente
                                    .nome,
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF23303B),
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                  border: InputBorder.none,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Il campo non può essere vuoto'),
                                ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, top: 6),
                              width: 316,
                              height: 63,
                              decoration: ShapeDecoration(
                                color: Color(0x26A4A9AE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: FormBuilderTextField(
                                name: 'cognome',
                                autofocus: false,
                                initialValue: Provider.of<UserDataProvider>(
                                        context,
                                        listen: true)
                                    .cliente
                                    .cognome,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Il campo non può essere vuoto'),
                                ]),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Cognome',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF23303B),
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, top: 6),
                              width: 316,
                              height: 63,
                              decoration: ShapeDecoration(
                                color: Color(0x26A4A9AE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: FormBuilderTextField(
                                name: 'email',
                                autofocus: false,
                                initialValue: Provider.of<UserDataProvider>(
                                        context,
                                        listen: true)
                                    .cliente
                                    .email,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Il campo non può essere vuoto'),
                                  FormBuilderValidators.email(
                                      errorText: 'Formato email non valido'),
                                  (value) {
                                    late int code;
                                    final retrofitService = RetrofitService(Dio(
                                        BaseOptions(
                                            contentType: "application/json")));
                                    retrofitService.checkEmail(value!);
                                    (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        code = snapshot.data!;
                                      } else {
                                        Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    };
                                    if (code == 500) {
                                      return 'Email già registrata';
                                    }
                                  }
                                ]),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF23303B),
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, top: 6),
                              width: 316,
                              height: 63,
                              decoration: ShapeDecoration(
                                color: Color(0x26A4A9AE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: FormBuilderTextField(
                                name: 'password',
                                initialValue: Provider.of<UserDataProvider>(
                                        context,
                                        listen: true)
                                    .cliente
                                    .password,
                                autofocus: false,
                                obscureText: true,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Il campo non può essere vuoto'),
                                  FormBuilderValidators.minLength(8,
                                      errorText: 'Password troppo corta'),
                                  FormBuilderValidators.maxLength(16,
                                      errorText: 'Password troppo lunga'),
                                ]),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Color(0xFF23303B),
                                    fontSize: 19,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FilledButton(
                      onPressed: () {
                        final validation = _formKey.currentState?.validate();
                        if (validation!) {
                          _formKey.currentState!.save();
                          Provider.of<UserDataProvider>(context, listen: false)
                                  .cliente
                                  .nome =
                              _formKey.currentState!.fields['nome']!.value
                                  .toString();
                          Provider.of<UserDataProvider>(context, listen: false)
                                  .cliente
                                  .cognome =
                              _formKey.currentState!.fields['cognome']!.value
                                  .toString();
                          Provider.of<UserDataProvider>(context, listen: false)
                                  .cliente
                                  .email =
                              _formKey.currentState!.fields['email']!.value
                                  .toString();
                          Provider.of<UserDataProvider>(context, listen: false)
                                  .cliente
                                  .password =
                              _formKey.currentState!.fields['password']!.value
                                  .toString();
                          late int code;
                          final retrofitService = RetrofitService(Dio(
                              BaseOptions(contentType: "application/json")));
                          retrofitService.updateCliente(
                              Provider.of<UserDataProvider>(context,
                                      listen: false)
                                  .cliente);
                          (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              code = snapshot.data!;
                            } else {
                              Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          };
                          if (code == 200) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Update'),
                                  content:
                                      Text('Profilo aggiornato con successo!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Chiudi il popup
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Update Failed'),
                                  content: Text(
                                      'Si è verificato un problema durante l\'aggiornamento. Per favore, riprova.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Chiudi il popup
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          //_formKey.currentState!.reset();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xFF102C57)),
                        padding:
                            const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.fromLTRB(0, 0, 0, 0)),
                        fixedSize: const MaterialStatePropertyAll(
                          Size(226, 74),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Salva",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.08,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
    );
  }
}

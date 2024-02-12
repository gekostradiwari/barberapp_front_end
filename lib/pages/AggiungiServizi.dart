import 'dart:core';
import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:barberapp_front_end/Model/Servizio.dart';
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

class AggiungiServizi extends StatefulWidget {
  const AggiungiServizi({super.key});

  @override
  State<AggiungiServizi> createState() => _AggiungiServiziState();
}

class _AggiungiServiziState extends State<AggiungiServizi> {
  final _formKey = GlobalKey<FormBuilderState>();
  String _selectedImage = 'taglio';

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
              'Aggiungi servizi',
              style: TextStyle(
                color: Color(0xFF23303B),
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
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
                                name: 'descrizione',
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Descrizione',
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
                                name: 'prezzo',
                                autofocus: false,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText:
                                      'Il campo non può essere vuoto'),
                                  FormBuilderValidators.numeric(
                                    errorText: 'Inserire un prezzo valido!',
                                  ),
                                ]),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Prezzo',
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
             const Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Seleziona un icona per il tuo servizio',
                  style: TextStyle(
                    color: Color(0xFF23303B),
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DropdownButton<String>(
                  value: _selectedImage,
                  menuMaxHeight: 200,
                  borderRadius: BorderRadius.circular(16),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedImage = newValue!;
                    });
                  },
                  items: GetImages.images.keys.map((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: SizedBox(
                        width: 50, // Larghezza dell'elemento a discesa
                        height: 50, // Altezza dell'elemento a discesa
                        child: Image.asset( // Immagine all'interno dell'elemento a discesa
                          GetImages.images[key]!, // Ottieni il percorso dell'immagine dalla mappa
                          fit: BoxFit.cover, // Adatta l'immagine all'elemento a discesa
                        ),
                      ),
                    );
                  }).toList(),
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
                          Servizio servizio = Servizio(0, _formKey.currentState!.fields['descrizione']!.value.toString(), GetImages.images[_selectedImage]!, _formKey.currentState!.fields['prezzo']!.value,[], Provider.of<UserDataProvider>(context,listen: false).titolare);
                          late int code;
                          final retrofitService = RetrofitService(Dio(
                              BaseOptions(contentType: "application/json")));
                          retrofitService.saveServizio(servizio);
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
                                  title: Text('Salvato'),
                                  content:
                                  Text('Servizio aggiunto con successo'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Provider.of<UserDataProvider>(context, listen: false).addServizi(servizio);
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

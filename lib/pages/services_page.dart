import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:barberapp_front_end/Model/Cliente.dart';
import 'package:barberapp_front_end/Model/Dipendente.dart';
import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:barberapp_front_end/Model/Titolare.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<Appuntamento> appuntamenti = [
    Appuntamento(
      1,
      DateTime.now(),
      DateTime.now(),
      Cliente(1, "Ciro", "Malafronte", "email", "pwd", []),
      Dipendente(1, "luca", "luca", "email", "pwd", []),
      Titolare(1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      Servizio(
        1,
        "Taglio",
        3,
        [],
        Titolare(
            1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      ),
    ),
    Appuntamento(
      1,
      DateTime.now(),
      DateTime.now(),
      Cliente(1, "Ciro", "Malafronte", "email", "pwd", []),
      Dipendente(1, "luca", "luca", "email", "pwd", []),
      Titolare(1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      Servizio(
        1,
        "Taglio",
        3,
        [],
        Titolare(
            1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      ),
    ),
    Appuntamento(
      1,
      DateTime.now(),
      DateTime.now(),
      Cliente(1, "Ciro", "Malafronte", "email", "pwd", []),
      Dipendente(1, "luca", "luca", "email", "pwd", []),
      Titolare(1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      Servizio(
        1,
        "Taglio",
        3,
        [],
        Titolare(
            1, "titolare", "pwd", "nomeTitolare", "cognomeTitolare", [], []),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Servizi",
            style: TextStyle(fontStyle: FontStyle.italic)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: appuntamenti.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(appuntamenti[index].cliente.nome)),
      ),
    );
  }
}

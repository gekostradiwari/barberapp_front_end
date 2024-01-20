import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<Servizio> servizi = [];
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
        itemCount: servizi.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(servizi[index].tipo)),
      ),
    );
  }
}

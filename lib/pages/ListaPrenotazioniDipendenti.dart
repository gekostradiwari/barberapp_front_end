import 'dart:developer';

import 'package:barberapp_front_end/Model/Appuntamento.dart';
import 'package:barberapp_front_end/Model/Dipendente.dart';
import 'package:barberapp_front_end/Model/getImages.dart';
import 'package:barberapp_front_end/Providers/UserDataProvider.dart';
import 'package:barberapp_front_end/utils/navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/Cliente.dart';
import '../Retrofit/RetrofitService.dart';


class ListaPrenotazioniDipendenti extends StatefulWidget {
  const ListaPrenotazioniDipendenti({super.key});

  @override
  State<ListaPrenotazioniDipendenti> createState() => _ListaPrenotazioniDipendentiState();
}

class _ListaPrenotazioniDipendentiState extends State<ListaPrenotazioniDipendenti> {
  late Dipendente dipendente;


  @override
  Widget build(BuildContext context) {
    //controllare se la variabile cliente è stata inizializzata
    dipendente = Provider.of<UserDataProvider>(context, listen: false).dipendente;
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Lista Prenotazioni",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: (){ Navigator.pushNamed(context, '/ProfiloDipendente');},
                  ),
                ),
              )
            ],
          ),
          /*
          Leggi la lista da server

        */
          body: _body(dipendente)
      );
  }
  FutureBuilder _body(Dipendente dipendente){
    final retrofitService = RetrofitService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
      future: retrofitService.getAppuntamentiByDipendente(dipendente),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Appuntamento> appuntamenti = snapshot.data == null ? [] : (snapshot.data as List<Appuntamento>);
          return  ListView.builder(
            itemCount: appuntamenti.length,//(snapshot.data as List<Appuntamento>).length,
            itemBuilder: (context, index) => BookTile(appuntamento: appuntamenti[index], callBack: (index) => setState(() =>
                retrofitService.deleteAppuntamento(appuntamenti[index])), index: index,
            ),
          );

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
class BookTile extends StatelessWidget {
  const BookTile({super.key,  required this.appuntamento, required this.callBack, required this.index});
  final Appuntamento appuntamento;
  final Function(int) callBack;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32,
                child: Image.asset(
                  GetImages.images["default"] ?? "",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(appuntamento.cliente.nominativo),
                    Text('${appuntamento.data.toString().substring(0,11)} ${appuntamento.ora.hour}:${appuntamento.ora.minute}'),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              appuntamento.isActive()?
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                    onTap: () async {
                      bool? res = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                              "Vuoi davvero eliminare questo elemento?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Si"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("No"),
                            ),
                          ],
                        ),
                      );
                      if (res != null && res == true){
                        callBack(index);
                      }
                      log(res.toString());
                    },
                    child: const Icon(Icons.delete_outline)),
              )
                  : const SizedBox(),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

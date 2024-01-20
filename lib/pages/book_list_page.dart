import 'dart:developer';

import 'package:barberapp_front_end/Model/getImages.dart';
import 'package:barberapp_front_end/utils/navigation_bar.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyNavigationBar(activeIndex: 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Lista Prenotazioni",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      /*
        Leggi la lista da server

      */
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const BookTile(),
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  const BookTile({super.key});

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
                    const Text("Nome cognome"),
                    Text("${DateTime.now()}"),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
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
                      /*
                        if (res != null && res == true){
                          richiama funzione per eliminare l'elementi [index] dalla lista
                        }
                      */
                      log(res.toString());
                    },
                    child: const Icon(Icons.delete_outline)),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

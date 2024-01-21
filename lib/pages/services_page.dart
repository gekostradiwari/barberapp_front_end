import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:barberapp_front_end/Model/Titolare.dart';
import 'package:barberapp_front_end/Model/getImages.dart';
import 'package:barberapp_front_end/utils/navigation_bar.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<Servizio> servizi = [
    Servizio(1, "taglio", 3, [], Titolare(1, "", "", "", "", [], [])),
    Servizio(1, "tipo", 3, [], Titolare(1, "", "", "", "", [], [])),
    Servizio(1, "taglio", 3, [], Titolare(1, "", "", "", "", [], [])),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height / 10,
          child: const MyNavigationBar(
            activeIndex: 0,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
              ServiceTile(servizio: servizi[index]),
        ));
  }
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key, required this.servizio});
  final Servizio servizio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                GetImages.images[servizio.tipo] ?? GetImages.images["default"]!,
                width: 128,
                height: 64,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(servizio.tipo),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

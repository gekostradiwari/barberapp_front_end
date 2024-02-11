




import 'package:barberapp_front_end/Model/Servizio.dart';
import 'package:barberapp_front_end/pages/AggiungiServizi.dart';
import 'package:barberapp_front_end/pages/BarbersAvaible.dart';
import 'package:barberapp_front_end/pages/HomePage_user.dart';
import 'package:barberapp_front_end/pages/ListaPrenotazioniDipendenti.dart';
import 'package:barberapp_front_end/pages/NavigationTab.dart';
import 'package:barberapp_front_end/pages/PrenotazioneEffettuata.dart';
import 'package:barberapp_front_end/pages/ProfiloDipendente.dart';
import 'package:barberapp_front_end/pages/ProfiloTitolare.dart';
import 'package:barberapp_front_end/pages/ProfiloUtente.dart';
import 'package:barberapp_front_end/pages/SignupDipendente_page.dart';
import 'package:barberapp_front_end/pages/services_page.dart';
import "package:flutter/material.dart";
import 'package:barberapp_front_end/pages/SignupUser_page.dart';
import 'package:barberapp_front_end/pages/login_page.dart';
import 'package:barberapp_front_end/pages/ReservationsPage.dart';
import 'package:barberapp_front_end/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/SignupUser_page':
        return MaterialPageRoute(builder: (context) => SignupUser_page());
      case '/login_page':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/NavigationTab':
        return MaterialPageRoute(builder: (context) => NavigationTab());
      case '/HomePage_user':
        return MaterialPageRoute(builder: (context) => HomePage_user());
      case '/services_page':
        return MaterialPageRoute(builder: (context) => ServicePage());
      case '/reservationsPage':
          return MaterialPageRoute(builder: (context) => ReservationsPage());
      case '/BarbersAvaible':
        return MaterialPageRoute(builder: (context) => BarbersAvaible());
      case '/prenotazioneEffettuata':
        return MaterialPageRoute(builder: (context) => PrenotazioneEffettuata());
      case '/ProfiloUtente':
        return MaterialPageRoute(builder: (context) => ProfiloUtente());
      case '/ListaPrenotazioniDipendente':
        return MaterialPageRoute(builder: (context) => ListaPrenotazioniDipendenti());
      case '/ProfiloDipendente':
        return MaterialPageRoute(builder: (context) => ProfiloDipendente());
      case '/SignupDipendente_page':
        return MaterialPageRoute(builder: (context) => SignupDipendente_page());
      case '/ProfiloTitolare':
        return MaterialPageRoute(builder: (context) => ProfiloTitolare());
      case '/AggiungiServizio':
        return MaterialPageRoute(builder: (context) => AggiungiServizi());


      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}

import 'package:barberapp_front_end/pages/login_page.dart';
import 'package:barberapp_front_end/pages/services_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: const Color(0xFF102C57))),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF102C57)),
        useMaterial3: true,
      ),
      routes: {
        "login": (context) => const LoginPage(),
        "servizi": (context) => const ServicePage(),
      },
      home: const LoginPage(),
    );
  }
}

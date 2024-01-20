import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const InputDecoration _fieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
  );

  static const EdgeInsets _fieldPadding =
      EdgeInsets.symmetric(horizontal: 32, vertical: 8);
  late TextEditingController _usernameController;
  late TextEditingController _pwdController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _pwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDAC0A3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.shape_line),
            Column(
              children: [
                Text(
                  "Accedi al tuo account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: _fieldPadding,
                  child: TextField(
                    decoration: _fieldDecoration.copyWith(hintText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    controller: _usernameController,
                  ),
                ),
                Padding(
                  padding: _fieldPadding,
                  child: TextField(
                    decoration: _fieldDecoration.copyWith(hintText: "password"),
                    controller: _pwdController,
                  ),
                ),
                FilledButton(
                  onPressed: () => accedi(context),
                  child: const Text(
                    "Accedi",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void accedi(BuildContext context) {
    Navigator.of(context).pushNamed("");
  }
}

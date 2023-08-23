import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 230, 253),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Card(
                color: Colors.amber[50],
                child: const Icon(Icons.person, size: 125),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                color: Colors.green,
                height: 30,
                child: const Text("Informe seu email"),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                color: Colors.green,
                height: 30,
                child: const Text("Informe a senha"),
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                color: Colors.green,
                height: 30,
                child: const Text("Login"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                height: 30,
                child: const Text("Cadastro"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

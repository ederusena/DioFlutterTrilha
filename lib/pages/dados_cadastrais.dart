import 'package:flutter/material.dart';
import 'package:trilhapp/pages/home_page.dart';

class DadosCadastrais extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastrais({super.key, required this.texto, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.redAccent),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainPage()))
          },
          // string literals must use single quotes
          child: Text('Voltar ${dados.length.toString()}'),
        ),
      ),
    );
  }
}

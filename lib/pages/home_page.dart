import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhapp/services/gerador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // gerar numero aleatorio
  int numeroAleatorio = 0;
  var quantidadeClicks = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          //style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        color: Colors.blueGrey[400],
        width: double.infinity,
        // margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.cyan,
                  child: Text(
                    "Ações do usuário",
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.amber,
                  child: Text(
                    "Foi clicado $quantidadeClicks vezes",
                  ),
                ),
              ),
              Text(
                quantidadeClicks.toString(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: Text(
                        "Row 1",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Text(
                        "Row 1",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Text(
                        "Row 1",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              quantidadeClicks++;
              numeroAleatorio =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}

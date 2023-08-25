import 'package:flutter/material.dart';
import 'package:trilhapp/pages/dados_cadastrais.dart';
import 'package:trilhapp/pages/pagina1.dart';
import 'package:trilhapp/pages/pagina2.dart';
import 'package:trilhapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Trilha Flutter"),
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/26800480?v=4"),
                ),
                accountName: Text("Eder Soares Sena"),
                accountEmail: Text("eder.sena@live.com"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: const Text("Dados cadastrais")),
                      onTap: () {
                        Navigator.pop(context, 'OK');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DadosCadastrais(
                                    texto: "Salve rapeize",
                                    dados: ["Eder", "Damaris"])));
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: const Text("Termos de uso e privacidade")),
                      onTap: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    InkWell(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: const Text("Configurações")),
                      onTap: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  PaginaOnePage(),
                  PaginaTwoPage(),
                  PaginaThreePage()
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) => setState(() {
                      pageController.animateToPage(value,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }),
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Configurações"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Perfil")
                ])
          ],
        ),
      ),
    );
  }
}

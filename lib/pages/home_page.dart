import 'package:flutter/material.dart';
import 'package:trilhapp/pages/card_page.dart';
import 'package:trilhapp/pages/image_assets.dart';
import 'package:trilhapp/pages/pagina3.dart';
import 'package:trilhapp/shared/widget/custom_drawer.dart';

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
        drawer: const CustomDrawer(),
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
                  CardPage(),
                  ImageAssetsPage(),
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

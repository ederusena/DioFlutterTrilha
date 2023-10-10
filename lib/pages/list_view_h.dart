import 'package:flutter/material.dart';
import 'package:trilhapp/shared/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuario 2"),
          subtitle: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Olá, tudo bem?"), Text("20:59")]),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Excluir",
                child: Text("Excluir"),
              ),
              const PopupMenuItem(
                value: "Editar",
                child: Text("Editar"),
              ),
            ],
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}

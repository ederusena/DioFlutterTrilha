import 'package:flutter/material.dart';
import 'package:trilhapp/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 10),
                          Text("Dados cadastrais"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context, 'OK');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastrais()));
                  },
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Row(
                        children: [
                          Icon(Icons.privacy_tip),
                          SizedBox(width: 10),
                          Text("Termos de uso e privacidade"),
                        ],
                      )),
                  onTap: () => {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
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
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 10),
                          Text("Configurações"),
                        ],
                      )),
                  onTap: () => {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
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
    );
  }
}

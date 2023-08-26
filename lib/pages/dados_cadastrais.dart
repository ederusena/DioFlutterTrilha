import 'package:flutter/material.dart';
import 'package:trilhapp/repository/nivel_repository.dart';
import 'package:trilhapp/shared/widget/separator.dart';
import 'package:trilhapp/shared/widget/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var emailController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  @override
  void initState() {
    niveis = nivelRepository.getNiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(color: Colors.redAccent),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextLabel(texto: "Nome"),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Digite seu nome",
                  ),
                ),
                const Separator(),
                const TextLabel(texto: "Data de Nascimento"),
                TextField(
                  controller: dataNascimentoController,
                  readOnly: true,
                  onTap: () async {
                    var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1940, 1, 1),
                        lastDate: DateTime(2050, 1, 1));

                    dataNascimentoController.text =
                        data.toString().substring(0, 10).trim();
                  },
                ),
                const Separator(),
                const TextLabel(texto: "Nível de experiência"),
                Column(
                  children: niveis
                      .map((e) => RadioListTile(
                            title: Text(e.toString()),
                            selected: nivelSelecionado == e.toString(),
                            value: e.toString(),
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              setState(() {
                                nivelSelecionado = value.toString();
                              });
                            },
                          ))
                      .toList(),
                ),
                TextButton(
                  onPressed: () => {print(dataNascimentoController.text)},
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ));
  }
}

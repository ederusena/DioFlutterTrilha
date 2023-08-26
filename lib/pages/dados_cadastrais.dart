import 'package:flutter/material.dart';
import 'package:trilhapp/repository/linguagens_repository.dart';
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
  var linguagemRepository = LinguagensRepository();
  var linguagens = [];
  var linguagensSelecionadas = [];
  var niveis = [];
  int tempoExperiencia = 1;
  var nivelSelecionado = "";
  double salarioEscolhido = 0;

  @override
  void initState() {
    linguagens = linguagemRepository.getLinguagens();
    niveis = nivelRepository.getNiveis();
    super.initState();
  }

  List<DropdownMenuItem> getAnosExperiencia() {
    var lista = <DropdownMenuItem>[];
    for (var i = 1; i < 50; i++) {
      lista.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return lista;
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
            child: ListView(
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
                DropdownButton(
                    isExpanded: true,
                    value: tempoExperiencia,
                    items: getAnosExperiencia(),
                    onChanged: (value) => {
                          setState(() {
                            tempoExperiencia = value as int;
                          })
                        }),
                Column(
                  children: niveis
                      .map((e) => RadioListTile(
                            dense: true,
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
                const TextLabel(texto: "Linguagens preferidas"),
                Column(
                  children: linguagens
                      .map((e) => CheckboxListTile(
                            title: Text(e),
                            value: linguagensSelecionadas.contains(e),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensSelecionadas.add(e);
                                });
                              } else {
                                setState(() {
                                  linguagensSelecionadas.remove(e);
                                });
                              }
                            },
                          ))
                      .toList(),
                ),
                const TextLabel(texto: "Tempo de experiência"),
                TextLabel(
                    texto:
                        "Pretenção salarial R\$ ${salarioEscolhido.round()}"),
                Slider(
                    min: 0,
                    max: 15000,
                    value: salarioEscolhido,
                    onChanged: (double value) {
                      setState(() {
                        salarioEscolhido = value;
                      });
                    }),
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

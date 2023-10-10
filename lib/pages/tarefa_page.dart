import 'package:flutter/material.dart';
import 'package:trilhapp/model/tarefa.dart';
import 'package:trilhapp/repository/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.getTarefas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite a tarefa'),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.adicionar(
                              Tarefa(descricaoController.text, false));

                          setState(() {});

                          descricaoController.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Adicionar")),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (BuildContext bc, int index) {
            var tarefa = _tarefas[index];
            return Text(tarefa.getDescricao());
          }),
    );
  }
}

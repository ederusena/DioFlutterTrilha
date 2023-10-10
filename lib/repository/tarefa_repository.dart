import 'package:trilhapp/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  void alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((tarefa) => tarefa.getId() == id)
        .first
        .setConcluido(concluido);

    // final Tarefa tarefa = _tarefas.firstWhere((tarefa) => tarefa.getId() == id);
    // tarefa.setConcluido(concluido);
  }

  Future<List<Tarefa>> getTarefas() async {
    await Future.delayed(const Duration(seconds: 2));
    return _tarefas;
  }
}

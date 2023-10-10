import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  String getId() {
    return _id;
  }

  bool getConcluido() {
    return _concluido;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }

  String getDescricao() {
    return _descricao;
  }

  void setDescripcao(String descricao) {
    _descricao = descricao;
  }
}

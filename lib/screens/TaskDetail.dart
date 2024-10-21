import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    super.key,
    required Tarefa tarefa,
  }) : _tarefa = tarefa;

  final Tarefa _tarefa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Detalhes da tarefa",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ID: ${_tarefa.id}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Criada em: ${DateFormat('dd/MM/y').format(_tarefa.dataCriacaoTarefa)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Título: ${_tarefa.titulo}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Descrição: ${_tarefa.descricao}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Observações: ${_tarefa.observacoes}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Prioridade: ${_tarefa.prioridade}",
                    style: TextStyle(
                      fontSize: 16,
                      color: getPriorityColor(_tarefa.prioridade),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Data: ${DateFormat('dd/MM/y').format(_tarefa.dataTarefa)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    DateTime.now().isBefore(_tarefa.dataTarefa)
                        ? "Status: Tarefa no prazo"
                        : "Status: Tarefa fora do prazo",
                    style: TextStyle(
                      color: DateTime.now().isBefore(_tarefa.dataTarefa)
                          ? Colors.green
                          : Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Voltar",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getPriorityColor(String prioridade) {
    switch (prioridade) {
      case 'BAIXA':
        return Colors.blue;
      case 'NORMAL':
        return Colors.orange;
      case 'ALTA':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

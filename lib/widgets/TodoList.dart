import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:f04_todo_list/routes/MyRoutes.dart';
import 'package:f04_todo_list/screens/TaskDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required List<Tarefa> listaTarefas,
  }) : _listaTarefas = listaTarefas;

  final List<Tarefa> _listaTarefas;

  @override
  Widget build(BuildContext context) {
    _openTaskDetail(Tarefa tarefa) {
      context.go('/details', extra: tarefa);
    }

    // Verifica se existem tarefas cadastradas
    if (_listaTarefas.isEmpty) {
      return Center(
        child: Text(
          "Nenhuma tarefa cadastrada",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _listaTarefas.length,
        itemBuilder: (context, index) {
          final tarefa = _listaTarefas.elementAt(index);
          final dataTarefa = tarefa.dataTarefa;
          final hoje = DateTime.now();

          // Verifica se a tarefa é para hoje ou já passou
          Color dataColor;
          if (dataTarefa.isBefore(hoje)) {
            dataColor = Colors.red; // Data já passou
          } else if (dataTarefa.year == hoje.year &&
              dataTarefa.month == hoje.month &&
              dataTarefa.day == hoje.day) {
            dataColor = Colors.green; // Data é hoje
          } else {
            dataColor = Colors.black; // Data futura
          }

          return GestureDetector(
            onTap: () => _openTaskDetail(tarefa),
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/y').format(dataTarefa),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: dataColor),
                    ),
                    Expanded(
                      child: Text(
                        tarefa.titulo,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        tarefa.prioridade,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

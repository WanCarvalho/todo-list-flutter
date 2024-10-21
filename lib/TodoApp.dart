import 'dart:math';

import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:f04_todo_list/widgets/TodoForm.dart';
import 'package:f04_todo_list/widgets/TodoList.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Tarefa> _listaTarefas = [];
  // List<Tarefa> _listaTarefas = [
  //   Tarefa(
  //       id: Random().nextInt(9999).toString(),
  //       titulo: "Estudar",
  //       descricao: "Estudar para obter sucesso",
  //       prioridade: 'ALTA',
  //       observacoes: "Matérias da faculdade",
  //       dataTarefa: DateTime.now()),
  //   Tarefa(
  //       id: Random().nextInt(9999).toString(),
  //       titulo: "Momento de lazer",
  //       descricao: "Jogar",
  //       prioridade: "NORMAL",
  //       observacoes: "Para desopilar",
  //       dataTarefa: DateTime.now())
  // ];

  void _addTarefa(String tituloTarefa, String descricaoTarefa, String prioridadeTarefa, String observacoesTarefa, DateTime dataSelecionada) {
    Tarefa _novaTarefa = Tarefa(
      id: Random().nextInt(9999).toString(),
      titulo: tituloTarefa,
      descricao: descricaoTarefa,
      prioridade: prioridadeTarefa,
      observacoes: observacoesTarefa,
      dataTarefa: dataSelecionada,
    );

    setState(() {
      _listaTarefas.add(_novaTarefa);
    });

    Navigator.of(context).pop();
  }

  void _openTaskForm() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Permite que o modal ocupe toda a altura
    builder: (context) => Container(
      padding: const EdgeInsets.all(16.0),
      height: 700, // Defina a altura desejada
      child: TodoForm(onSubmit: _addTarefa),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minhas Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
        actions: [
          IconButton(
            onPressed: _openTaskForm,
            icon: const Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            //TodoForm(onSubmit: _addTarefa),
            TodoList(listaTarefas: _listaTarefas)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openTaskForm,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

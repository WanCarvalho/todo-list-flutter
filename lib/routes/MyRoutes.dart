import 'package:f04_todo_list/TodoApp.dart';
import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:f04_todo_list/screens/TaskDetail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const TodoApp();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) {
          final tarefa = state.extra as Tarefa;
          return TaskDetail( tarefa: tarefa,);
        },
      ),
    ],
  ),
]);

import 'package:flutter/material.dart';
import 'package:my_app/todo_model.dart';

class TodoDetailsPage extends StatelessWidget {
  final Todo todo;

  const TodoDetailsPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo ${todo.id}"),
      ),
      body: Column(
        children: [
          Text(todo.title),
          Text(todo.body),
        ],
      ),
    );
  }
}

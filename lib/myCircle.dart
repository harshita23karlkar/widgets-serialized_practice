import 'package:flutter/material.dart';
import 'package:my_app/todo_model.dart';

class MyCircle extends StatelessWidget {
  // final String src;
  final Todo todo;
  const MyCircle({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    print(todo.toJson());
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Text(todo.id.toString()),
          title: Text(todo.title),
          subtitle: Text(todo.body),
          trailing: Text(todo.userId.toString()),
        ));
  }
}

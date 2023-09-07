import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';
import 'model/todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todos) {
          return todos.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(todos[index].title),
                          subtitle: Text(
                              todos[index].completed ? 'Completed' : 'Pending'),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

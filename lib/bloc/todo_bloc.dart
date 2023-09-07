import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/service/api.dart';

import '../model/todo.dart';

class TodoBloc extends Cubit<List<Todo>> {
  final ApiService _apiService = ApiService();

  TodoBloc() : super([]);

  Future<void> fetchTodos() async {
    try {
      List<Todo> todos = await _apiService.getTodos();
      emit(todos);
    } catch (e) {
      rethrow;
    }
  }
}

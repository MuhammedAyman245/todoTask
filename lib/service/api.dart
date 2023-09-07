import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todo_app/model/todo.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
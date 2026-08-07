import 'package:task_1/core/network/api_client.dart';
import 'package:task_1/feature/todos/data/models/todo_model.dart';

class TodoService {
  // Get Todo bu id
  Future<Todo?> getTodo(int id) async {
    try {
      // await Future.delayed(const Duration(seconds: 5)); // Simulate network delay
      final response = await ApiClient().dio.get('/todoSDASDASDASD');
      return Todo.fromJson(response.data);
    } catch (e) {
      // return null;
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }
  // Get Todo bu id
  Future<List<Todo>> getTodos() async {
    try {
      // await Future.delayed(const Duration(seconds: 5)); // Simulate network delay
      final response = await ApiClient().dio.get('/todo');
      // return Todo.fromJson(response.data);
      return (response.data as List).map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      // return null;
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }
}

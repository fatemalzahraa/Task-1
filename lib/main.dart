import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_1/auth/auth.dart';
import 'package:task_1/core/error/error_handler.dart';
import 'package:task_1/core/network/api_client.dart';
import 'package:task_1/core/network/api_service.dart';
import 'package:task_1/feature/todos/data/models/todo_model.dart';
import 'package:task_1/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiClient().init();




// try {
//     final response = await ApiClient().dio.get('/todos/1');
//     print('نجح: ${response.data}');
//   } catch (e) {
//     print('فشل: $e');
//   }


  //   try {
  //   await ApiClient().dio.get('/todosXYZ');
  // } catch (e) {
  //   print('فشل: $e');
  // }

  // // اختبار الكاش
  // final stopwatch1 = Stopwatch()..start();
  // await ApiClient().dio.get('/todos/1');
  // stopwatch1.stop();
  // print('الطلب الأول: ${stopwatch1.elapsedMilliseconds}ms');

  // final stopwatch2 = Stopwatch()..start();
  // await ApiClient().dio.get('/todos/1');
  // stopwatch2.stop();
  // print('الطلب الثاني: ${stopwatch2.elapsedMilliseconds}ms');



// try {
//   await ApiClient().dio.get('/todosXYZ');
// } on DioException catch (e) {
//   final apiException = handleDioError(e);
//   print('Error message: ${apiException.message}');
//   print('Status code: ${apiException.statusCode}');
// }

final apiService = ApiService(ApiClient().dio);
 //test
// final todo = await apiService.get<Map<String, dynamic>>(
//   '/todos/1',
//   (json) => json as Map<String, dynamic>,
// );
// print(todo);

 //test
// final todo = await apiService.get<Todo>(
//   '/todos/1',
//   (json) => Todo.fromJson(json as Map<String, dynamic>),
// );

// print('ID: ${todo.id}');
// print('User ID: ${todo.userId}');
// print('Title: ${todo.title}');
// print('Completed: ${todo.completed}');

  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1. إنشاء كائن AuthNotifier مرة واحدة فقط
  late final AuthNotifier _authNotifier;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authNotifier = AuthNotifier();
    _appRouter = AppRouter(_authNotifier);
    

  
  }
 

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
    );
  }
}
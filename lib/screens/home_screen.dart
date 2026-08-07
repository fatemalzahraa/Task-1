import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:task_1/core/network/api_client.dart';
import 'package:task_1/feature/todos/data/models/todo_model.dart';
import 'package:task_1/feature/todos/services/todo_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                String name = 'Fatema';
                context.push('/home/profile/$name');
              },
              child: const Text('Profile'),
            ),
            ElevatedButton(onPressed: () async {}, child: const Text('Test')),

            FutureBuilder(
              future: TodoService().getTodo(1),
              builder: (context, AsyncSnapshot<Todo?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final todo = snapshot.data!;
                  return Text('Todo Title: ${todo.title}');
                } else {
                  return const Text('No data');
                }
              },
            ),
            // FutureBuilder(
            //   future: TodoService().getTodo(1),
            //   builder: (context, AsyncSnapshot<Todo?> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const CircularProgressIndicator();
            //     } else if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     } else if (snapshot.hasData) {
            //       final todo = snapshot.data!;
            //       return Text('Todo Title: ${todo.title}');
            //     } else {
            //       return const Text('No data');
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/task_provider.dart';
import 'package:todoey/screens/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        initialRoute: TasksPage.id,
        routes: {
          TasksPage.id: (context) => const TasksPage(),
        },
      ),
    );
  }
}


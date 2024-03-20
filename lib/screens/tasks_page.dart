import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/task_provider.dart';
import 'package:todoey/screens/task_lists.dart';
import 'add_task_page.dart';

class TasksPage extends StatefulWidget {

  static const String id = 'TasksPage';

  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${context.watch<TaskProvider>().tasks.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
              color: Colors.white,
            ),
              child: TaskLists(),
          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        tooltip: 'Press plus if you want add a task',
        child: const Icon(Icons.add, size: 30,),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context, builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskPage(),
            ),
          ));
        },
      ),
    );
  }
}

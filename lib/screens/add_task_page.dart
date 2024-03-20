import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/task_provider.dart';

class AddTaskPage extends StatefulWidget {

  const AddTaskPage({
    super.key,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  late String userInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              userInput = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            ),
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false).addTask(userInput);
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

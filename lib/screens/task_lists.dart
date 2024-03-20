import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/task_provider.dart';

class TaskLists extends StatefulWidget {

  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: task.isDone,
                onChanged: (value) {
                  taskData.updateTaskCheckbox(task);
                },
              ),
              onLongPress: () => taskData.deleteTask(task),
            );
          },
        );
      }
    );
  }
}

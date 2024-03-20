import 'package:flutter/cupertino.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String task) {
    final newTask = Task(title: task);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTaskCheckbox(Task task) {
    task.checkboxChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
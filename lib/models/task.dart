class Task {

  final String title;
  bool isDone = false;

  Task({
    required this.title,
  });

  void checkboxChange() {
    isDone = !isDone;
  }
}
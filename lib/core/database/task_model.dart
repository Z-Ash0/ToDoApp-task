class Task {
  final int statusCode;
  final String? content;
  final String title;
  final String? deadline;
  Task(
      {required this.statusCode,
      this.content,
      required this.title,
      this.deadline});
}

import 'package:to_do_app/core/database/sql_database_service.dart';
import 'package:to_do_app/core/database/task_model.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class TasksRepository {
  final SqlDBService sqlDBService;
  TasksRepository({required this.sqlDBService});

  Future<void> addTask(String title, String? content, String? deadline) async {
    await sqlDBService.insertInTable(tasksTableName, {
      tasksTitleColumnName: title,
      tasksDescriptionColumnName: content,
      tasksDeadlineColumnName: deadline,
      tasksStatusColumnName: 0,
    });
  }

  Future<List<Task>> getAllTasks() async {
    final tableData = await sqlDBService.getTableData(tasksTableName);
    return tableData
        .map((task) => Task(
            statusCode: task[tasksStatusColumnName] as int,
            content: task[tasksDescriptionColumnName] as String?,
            title: task[tasksTitleColumnName] as String,
            deadline: task[tasksDeadlineColumnName] as String?))
        .toList();
  }

  Future<void> updateTaskData(int id,
      {String? title, String? content, String? deadline, int? status}) async {
    await sqlDBService.updateTableValues(
      tasksTableName,
      {
        tasksTitleColumnName: title,
        tasksDescriptionColumnName: content,
        tasksDeadlineColumnName: deadline,
        tasksStatusColumnName: status,
      },
      where: '$tasksIdColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    await sqlDBService.deleteFromDb(tasksTableName,
        where: '$tasksIdColumnName = ?', whereArgs: [id]);
  }

  Future<void> resetTasks() async {
    await sqlDBService.deleteFromDb(tasksTableName);
  }
}

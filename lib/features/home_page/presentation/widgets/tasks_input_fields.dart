import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';

class TasksInputFields extends StatefulWidget {
  const TasksInputFields({super.key});

  @override
  State<TasksInputFields> createState() => _TasksInputFieldsState();
}

class _TasksInputFieldsState extends State<TasksInputFields> {
  int currentYear = DateTime.now().year;
  late DateTimeRange taskDeadLine;
  @override
  void initState() {
    taskDeadLine = DateTimeRange(start: DateTime.now(), end: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatRUPlanningFor,
          style: AppTextStyles.purpleSize42.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          decoration: InputDecoration(
            hintText: AppStrings.title,
            hintStyle: AppTextStyles.greySize12.copyWith(fontSize: 16),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.arrow_right,
                color: AppColors.primaryColor, size: 30),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),

        //* Task Description Field
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: AppStrings.description,
            labelStyle: AppTextStyles.greySize12.copyWith(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2),
            ),
            prefixIcon: const Icon(Icons.edit, color: AppColors.primaryColor),
          ),
        ),
        ListTile(
          onTap: _dateRangePicker,
          title: const Text(
            AppStrings.taskDeadline,
            style: AppTextStyles.greySize12,
          ),
          subtitle: Text(
              ' ${DateFormat('yyyy/MM/dd').format(taskDeadLine.start)} - ${DateFormat('yyyy/MM/dd').format(taskDeadLine.end)}'),
          leading: const Icon(Icons.date_range_outlined,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Future<void> _dateRangePicker() async {
    final DateTimeRange? selectedDeadline = await showDateRangePicker(
      context: context,
      firstDate: DateTime(currentYear),
      lastDate: DateTime(currentYear + 5),
    );
    if (selectedDeadline == null) return;
    setState(() => taskDeadLine = selectedDeadline);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('The deadline is for ${taskDeadLine.duration.inDays} days'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';
import 'package:to_do_app/features/home_page/presentation/widgets/custom_button.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  DateTimeRange taskDeadLine =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  int currentYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.primaryColor, size: 40),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_task,
                      size: 30, color: AppColors.primaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Add New Task',
                    style: AppTextStyles.purpleSize42.copyWith(fontSize: 35),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'What are you planning 🤩?',
                style: AppTextStyles.purpleSize42.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),

              //* Task Name Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: AppTextStyles.greySize12.copyWith(fontSize: 16),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.arrow_right,
                      color: AppColors.primaryColor, size: 30),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),

              //* Task Description Field
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: AppTextStyles.greySize12.copyWith(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                  ),
                  prefixIcon:
                      const Icon(Icons.edit, color: AppColors.primaryColor),
                ),
              ),
              ListTile(
                onTap: () async {
                  final DateTimeRange? selectedDeadline =
                      await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(currentYear),
                    lastDate: DateTime(currentYear + 5),
                  );
                  if (selectedDeadline == null) return;
                  setState(() => taskDeadLine = selectedDeadline);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'The deadline is whithin ${taskDeadLine.duration.inDays} days'),
                    ),
                  );
                },
                title: Text(
                  'Task Deadline',
                  style: AppTextStyles.greySize12,
                ),
                subtitle: Text(
                    ' ${DateFormat('yyyy/MM/dd').format(taskDeadLine.start)} - ${DateFormat('yyyy/MM/dd').format(taskDeadLine.end)}'),
                leading: const Icon(Icons.date_range_outlined,
                    color: AppColors.primaryColor),
              ),
              const SizedBox(height: 30),

              //* Add Task Button
              CustomButton(title: 'Add Task', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

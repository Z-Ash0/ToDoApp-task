import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';
import 'package:to_do_app/features/home_page/presentation/widgets/custom_button.dart';
import 'package:to_do_app/features/home_page/presentation/widgets/tasks_input_fields.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.colorWhite,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHeader(AppStrings.addNewTask),
              const TasksInputFields(),
              CustomButton(title: AppStrings.addTask, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader(String title) {
  return Row(
    children: [
      const Expanded(child: Divider(height: 1, color: AppColors.primaryColor)),
      const SizedBox(width: 10),
      Text(
        title,
        style: AppTextStyles.purpleSize42.copyWith(fontSize: 35),
      ),
      const Expanded(child: Divider(height: 1, color: AppColors.primaryColor)),
    ],
  );
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded,
          color: AppColors.primaryColor, size: 40),
    ),
  );
}

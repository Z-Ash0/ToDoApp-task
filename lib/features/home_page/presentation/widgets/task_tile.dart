import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primaryColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(Icons.done, color: AppColors.colorWhite),
        ),
        title: const Text(
          'Task name',
          style: TextStyle(fontSize: 14),
        ),
        subtitle: const Text(
          'Task description',
          style: AppTextStyles.greySize12,
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Date', style: AppTextStyles.greySize12),
            Text('SubDate', style: AppTextStyles.greySize12),
          ],
        ),
      ),
    );
  }
}

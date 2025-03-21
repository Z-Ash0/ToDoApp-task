import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDone ? AppColors.primaryColorLight : AppColors.colorWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () => setState(() => isDone = !isDone),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? AppColors.primaryColor : AppColors.colorWhite,
                border: Border.all(color: AppColors.colorGrey, width: 2),
              ),
              child: isDone
                  ? const Icon(Icons.done, color: AppColors.colorWhite)
                  : null,
            ),
          ),
          title: Text(
            'Task name',
            style: AppTextStyles.greySize12.copyWith(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Task description',
            style: AppTextStyles.greySize12.copyWith(
                decoration: isDone ? TextDecoration.lineThrough : null),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date', style: AppTextStyles.greySize12),
              Text('SubDate', style: AppTextStyles.greySize12),
            ],
          ),
        ),
      ),
    );
  }
}

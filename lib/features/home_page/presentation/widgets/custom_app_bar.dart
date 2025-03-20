import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 5, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.myTask,
                  style: TextStyle(fontSize: 32),
                ),
                CircularProgressIndicator(
                  value: 1 / 3,
                  backgroundColor: AppColors.colorGrey,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '1 of 3 tasks',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(width: 10),
                Expanded(child: Divider(height: 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

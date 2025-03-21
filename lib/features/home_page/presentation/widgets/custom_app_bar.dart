import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
                  style: AppTextStyles.purpleSize42,
                ),
                CircularProgressIndicator(
                  value: 1 / 3,
                  backgroundColor: AppColors.primaryColorLight,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '1 of 3 tasks',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.primaryColorLight),
                ),
                SizedBox(width: 10),
                Expanded(
                    child:
                        Divider(height: 1, color: AppColors.primaryColorLight)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          title,
          style: AppTextStyles.greySize12
              .copyWith(color: AppColors.colorWhite, fontSize: 18),
        ),
      ),
    );
  }
}

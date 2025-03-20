import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //* AppBar
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppStrings.myTask, style: TextStyle(fontSize: 32)),
                Text('1 of 3 tasks',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Divider(height: 1, indent: 200)
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Container(
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
                    style: TextStyle(fontSize: 12, color: AppColors.colorGrey),
                  ),
                  trailing: const Column(
                    children: [
                      Text('Date',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.colorGrey)),
                      Text('SubDate',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.colorGrey))
                    ],
                  ),
                ),
              ),
              itemCount: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Icon(Icons.add, color: AppColors.colorWhite),
      ),
    );
  }
}

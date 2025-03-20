import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/home_page/presentation/widgets/custom_app_bar.dart';
import 'package:to_do_app/features/home_page/presentation/widgets/task_tile.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const CustomAppBar(),
              SliverList.separated(
                itemBuilder: (context, index) => const TaskTile(),
                itemCount: 20,
                separatorBuilder: (BuildContext context, _) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(height: 1),
                ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_constants.dart';
import 'package:to_do_app/features/home_page/presentation/views/add_new_task_screen.dart';
import 'package:to_do_app/features/home_page/presentation/views/home_page_screen.dart';

class Routes {
  Route? routeGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.homePageView:
        return MaterialPageRoute(builder: (context) => const HomePageScreen());
      case AppRoutes.addNewTaskView:
        return MaterialPageRoute(
            builder: (context) => const AddNewTaskScreen());
      default:
        return null;
    }
  }
}

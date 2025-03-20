import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/routes.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    Routes appRoutes = Routes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.routeGenerate,
    );
  }
}

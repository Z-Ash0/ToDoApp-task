import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const ToDoApp(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:vitagram/src/app.dart';
import 'package:vitagram/src/binding/init_bindings.dart';

// flutter pub add get
// flutter pub add logger
// flutter pub add expandable_text
// flutter pub add cached_network_image
final logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      initialBinding: InitBinding(),
      home: const App(),
    );
  }
}

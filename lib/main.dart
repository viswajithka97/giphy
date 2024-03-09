import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'home_page/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

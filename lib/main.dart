import 'package:flutter/material.dart';
import 'package:spoon_hub/service_locator.dart';
import 'package:spoon_hub/ui/views/home_view.dart';

Future<void> main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: HomeView(),
    );
  }
}

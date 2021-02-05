import 'package:flutter/material.dart';
import 'package:resume_generator/main_route.dart';

void main() {
  runApp(ResumeGeneratorApp());
}

final Map<String, WidgetBuilder> routes = {
  '/': (context) => MainScreen(),
};

class ResumeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

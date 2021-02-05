import 'package:flutter/material.dart';
import 'package:resume_generator/main_route.dart';
import 'package:resume_generator/personal_info_route.dart';

void main() {
  runApp(ResumeGeneratorApp());
}

final Map<String, WidgetBuilder> routes = {
  '/': (context) => MainScreen(),
  '/personal_info': (context) => PersonalInfoScreen(),
};

class ResumeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

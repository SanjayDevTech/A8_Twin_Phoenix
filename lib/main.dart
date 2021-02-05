import 'package:flutter/material.dart';

void main() {
  runApp(ResumeGeneratorApp());
}

class ResumeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: Text('Hello Flutter'),
      ),
    );
  }
}

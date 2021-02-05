import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Generator'),
      ),
      body: Center(
        child: Text(
          'Hello Flutter',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

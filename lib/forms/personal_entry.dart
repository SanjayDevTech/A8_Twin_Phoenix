import 'dart:ui';

import 'package:flutter/material.dart';

class PersonalEntryForm extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _addrTextController = TextEditingController();
  final _phnoTextController = TextEditingController();
  final void Function(String name, String email, String addr, String phno)
      onChangedHandler;
  final _formKey = GlobalKey<FormState>();

  PersonalEntryForm(this.onChangedHandler);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => onChangedHandler(
        _nameTextController.text,
        _emailTextController.text,
        _addrTextController.text,
        _phnoTextController.text,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameTextController,
            decoration: InputDecoration(hintText: 'Your Name Please : )'),
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            controller: _emailTextController,
            decoration: InputDecoration(hintText: 'Your Email Please : )'),
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: _addrTextController,
            decoration: InputDecoration(hintText: 'Address here'),
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            controller: _phnoTextController,
            decoration: InputDecoration(hintText: 'Your Number Please : )'),
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

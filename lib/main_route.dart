import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final _actionTitles = [
    'Edit Personal Info',
    'Create Resumes',
    'Saved Resumes'
  ];
  final _actionImages = [
    'personal_info.png',
    'personal_info.png',
    'personal_info.png'
  ];
  final _actionKeys = ['personal_bio_list', 'create_resumes', 'saved_resumes'];

  Widget _buildAction(
      BuildContext context, String title, String image, String key) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/$key');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/$image'),
              height: 80,
              width: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Resume Generator'),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => _buildAction(
                context,
                _actionTitles[index],
                _actionImages[index],
                _actionKeys[index],
              )),
    );
  }
}

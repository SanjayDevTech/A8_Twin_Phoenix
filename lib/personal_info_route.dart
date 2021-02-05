import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  final _actionTitles = [
    'Personal Details',
    'Education',
    'Skills',
    'Experience',
    'Interests',
    'Achievements',
    'Links'
  ];

  final _actionKeys = [
    'i_details',
    'i_education',
    'i_skills',
    'i_experience',
    'i_interests',
    'i_achievements',
    'i_links',
  ];

  final _actionIcons = [
    Icons.person,
    Icons.school,
    Icons.trending_up,
    Icons.explore,
    Icons.widgets,
    Icons.volunteer_activism,
    Icons.link
  ];

  Widget _buildAction(
      BuildContext context, String title, String key, IconData icon) {
    return Center(
      child: SizedBox(
        height: 80,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          elevation: 6,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/$key');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Personal Info'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => _buildAction(
          context,
          _actionTitles[index],
          _actionKeys[index],
          _actionIcons[index],
        ),
      ),
    );
  }
}

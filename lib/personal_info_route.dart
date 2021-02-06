import 'package:flutter/material.dart';
import 'package:resume_generator/forms/personal_entry.dart';

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

  final _actionModals = [
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
    (context) => PersonalEntryForm((_, __, ___, ____) => {}),
  ];

  Widget _buildAction(BuildContext context, int index) {
    final title = _actionTitles[index];
    final key = _actionKeys[index];
    final icon = _actionIcons[index];
    final modal = _actionModals[index];
    return Center(
      child: SizedBox(
        height: 80,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          elevation: 6,
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(title),
                        content: modal(context),
                      ));
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
        itemBuilder: (context, index) => _buildAction(context, index),
      ),
    );
  }
}

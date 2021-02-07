import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_generator/personal_info_route.dart';
import './database/daos.dart';
import './database/entities.dart';
import './main.dart';

class PersonalBioListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bioDao = Provider.of<DaoModel>(context).bioDao;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Multiple Bios'),
      ),
      body: _buildBody(bioDao),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PersonalInfoScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BioDao bioDao) {
    return StreamBuilder(
      stream: bioDao.findAllBios(),
      builder: (BuildContext context, AsyncSnapshot<List<Bio>> snapshot) {
        if (snapshot.hasData) {
          final bioList = snapshot.data;
          if (bioList.isEmpty)
            return Center(
              child: Text(
                'Click ➕ button to add bios',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
            );
          return ListView.builder(
            itemCount: bioList.length,
            itemBuilder: (context, index) => _buildBioRow(bioList[index]),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildBioRow(Bio bio) {
    return Center(
      child: Text('Name: ${bio.personal.name}'),
    );
  }
}

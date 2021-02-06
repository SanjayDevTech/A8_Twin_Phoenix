import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './database/app_database.dart';
import './create_resumes_route.dart';
import './database/daos.dart';
import './main_route.dart';
import './personal_bio_list_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _database = await AppDatabase.instance;
  final bioDao = _database.bioDao;
  runApp(ChangeNotifierProvider(
    create: (context) => DaoModel(bioDao),
    child: ResumeGeneratorApp(),
  ));
}

class DaoModel extends ChangeNotifier {
  final BioDao bioDao;
  DaoModel(this.bioDao);
}

final Map<String, WidgetBuilder> routes = {
  '/': (context) => MainScreen(),
  '/personal_bio_list': (context) => PersonalBioListScreen(),
  '/create_resumes': (context) => CreateResumesScreen(),
};

class ResumeGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

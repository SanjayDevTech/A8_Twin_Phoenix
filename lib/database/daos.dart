import 'package:floor/floor.dart';
import './entities.dart';

@dao
abstract class BioDao {
  @Query('SELECT * FROM Bio')
  Future<List<Bio>> findAllBiosAsync();

  @Query('SELECT * FROM Bio')
  Stream<List<Bio>> findAllBios();

  @insert
  Future<void> insertBio(Bio bio);
}

import 'package:alura_flutter_curso_1/data/DAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'database.db');

  return openDatabase(path,
      onCreate: (db, version) => db.execute(TaskDAO.tableSql), version: 1);
}

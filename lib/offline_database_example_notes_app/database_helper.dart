import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// a utility class that manages database operations

class DatabaseHelper {
  DatabaseHelper._();

  static Future<Database> initializeDatabase() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = join(directory.path, 'offline_database.db');
    return openDatabase(
      version: 1,
      path,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE 
          Users (
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT
            )''',
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final databaseService = DatabaseService();

/// Responsible for:
/// - database initialization, creation, and migration
/// - providing an instance of the database
/// - database opening and closing

class DatabaseService extends ChangeNotifier {
  late Database _db;

  Database get db => _db;

  ({
    String notes,
    String images,
  }) tables = (notes: 'Notes', images: 'Images');

  Future<void> initialize() async {
    final String path = await _getPath('offline_database');

    _db = await _openDatabase(3, path);

    await _getCurrentSchemaInformation(_db);

    debugPrint("database opened successfully.");
  }

  Future<void> closeDatabase() async {
    await db.close();
    debugPrint("database closed successfully.");
  }
}

Future<Database> _openDatabase(int version, String path) async {
  return openDatabase(
    version: version, // latest version 3
    path,
    onCreate: _createDatabase,
    onUpgrade: _migrateDatabase,
    onConfigure: _configureDatabase,
  );
}

Future<void> _createDatabase(Database db, int version) async {
  await _createNotesTable(db);

  await _createImagesTable(db);
}

Future<void> _migrateDatabase(Database db, int oldVersion, int newVersion) async {
  if (oldVersion == 2) {
    await _createImagesTable(db);
  }
}

Future<void> _configureDatabase(Database db) async {
  // turn on the use of foreign key constraints | required configuration to use foreign keys
  await db.execute('PRAGMA foreign_keys = ON');
}

Future<void> _createNotesTable(Database db) async {
  await db.execute('DROP TABLE IF EXISTS Notes');

  await db.execute(
    '''CREATE TABLE 
          Notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            created_at TEXT,
            updated_at TEXT
            )''',
  );
}

Future<void> _createImagesTable(Database db) async {
  await db.execute('DROP TABLE IF EXISTS Images');

  await db.execute(
    '''CREATE TABLE 
          Images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            note_id INTEGER,
            image_name TEXT,
            FOREIGN KEY (note_id) REFERENCES Notes(id) ON DELETE CASCADE
            )''',
  );
}

Future<String> _getPath(String databaseName) async {
  // the platform specific directory
  final directory = await getApplicationDocumentsDirectory();

  // path where the database file will be saved
  final path = join(directory.path, databaseName);

  return path;
}

Future<void> _getCurrentSchemaInformation(Database db) async {
  final currentSchema = [
    ...await db.query('sqlite_master', columns: ['sql'])
  ];

  currentSchema.removeWhere((Map result) => result['sql'] == 'CREATE TABLE sqlite_sequence(name,seq)');

  debugPrint('Current Schema:\n');
  for (int i = 0; i < currentSchema.length; i++) {
    debugPrint('${currentSchema[i]['sql']}\n');
  }
}

// HISTORICAL DATABASE VERSIONS

//   - previous version numbers: [1]

// openDatabase(
//   path,
//   version: 1,
//   onCreate: (db, version) {
//     return db.execute("CREATE TABLE Notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, created_at TEXT)");
//   },
// );

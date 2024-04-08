import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final databaseService = DatabaseService();

// TODO: add explanatory comments

class DatabaseService extends ChangeNotifier {
  late Database _db;

  Database get db => _db;

  ({
    String notes,
    String images,
  }) tables = (notes: "Notes", images: "Images");

  static Future<void> _createNotesTable(Database db) async {
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

  static Future<void> _createImagesTable(Database db) async {
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

  Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = join(directory.path, 'offline_database');

    _db = await openDatabase(
      version: 3,
      path,
      onCreate: (db, version) async {
        await _createNotesTable(db);

        await _createImagesTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion == 2) {
          await _createImagesTable(db);
        }
      },
      onConfigure: (db) async {
        // turn on the use of foreign key constraints | required
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );

    await getCurrentSchema();

    debugPrint("database opened successfully.");
  }

  Future<void> closeDatabase() async {
    await db.close();
    debugPrint("database closed successfully.");
  }

  Future<void> getCurrentSchema() async {
    final currentSchema = await db.query(
      'sqlite_master',
      columns: ['sql'],
    );

    debugPrint('Current Schema:\n');
    for (int i = 0; i < currentSchema.length; i++) {
      debugPrint('${currentSchema[i]['sql']}\n');
    }
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

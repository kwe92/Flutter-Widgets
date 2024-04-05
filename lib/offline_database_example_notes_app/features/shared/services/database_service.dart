import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final databaseService = DatabaseService();

// TODO: Update Schema to include updated at column

class DatabaseService extends ChangeNotifier {
  late Database _db;

  Database get db => _db;

  ({
    String notes,
  }) tables = (notes: "Notes");

  DatabaseService() {
    // initialize();
  }

  Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();

    final path = join(directory.path, 'offline_database');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute("CREATE TABLE Notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, created_at TEXT)");
      },
    );

    debugPrint("database opened successfully.");
  }

  Future<void> closeDatabase() async {
    await db.close();
    debugPrint("database closed successfully.");
  }
}

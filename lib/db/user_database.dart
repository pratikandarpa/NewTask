// ignore_for_file: unnecessary_new, unused_field, avoid_print, prefer_const_declarations, unused_local_variable

import 'package:practical_test/db/db_model.dart';
import 'package:practical_test/pages/home/model/home_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final name = 'TEXT NOT NULL';
    final gender = 'TEXT NOT NULL';
    final location = 'TEXT NOT NULL';
    final email = 'TEXT NOT NULL';
    final age = 'TEXT NOT NULL';
    final phone = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $userData ( 
  ${UsersFields.name} $name,
  ${UsersFields.gender} $gender,
  ${UsersFields.location} $location,
  ${UsersFields.email} $email,
  ${UsersFields.age} $age,
  ${UsersFields.phone} $phone
  )
''');
  }

  Future create(Welcome welcome) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    await db.insert(userData, welcome.toJson());
    print(welcome.name);
  }

  Future<List<Welcome>> readAllNotes() async {
    final db = await instance.database;
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
    final result = await db.query(userData);
    print(result);
    return result.map((json) => Welcome.fromJson(json)).toList();
  }

  Future<void> delete() async {
    final db = await instance.database;
    final result = await db.delete("userDataa");
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

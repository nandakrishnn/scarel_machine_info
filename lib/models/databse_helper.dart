
import 'package:scarel_info_machine/models/database_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseversion = 1;
  static const table = 'emailCampaign';
  static const columnId = '_id';
  static const columnSubject = 'subject';
  static const columnpreviewText = 'previewtext';
  static const columnfromName = 'fromName';
  static const columnfromEmail = 'formemail';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabse();
    return _database!;
  }

  Future<Database> _initDatabse() async {
    return await openDatabase('emailcampaign.db',
        version: _databaseversion, onCreate: _oncreate);
  }

  Future<void> _oncreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table(
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnSubject TEXT NOT NULL,
          $columnpreviewText TEXT NOT NULL,
          $columnfromName TEXT  NOT NULL,
          $columnfromEmail TEXT NOT NULL,
        )
''');
  }

  Future<int> insertCampaign(EmailCampaign campaign) async {
    final db = await database;
    return await db.insert(table, {
      columnSubject: campaign.subject,
      columnpreviewText: campaign.previewtext,
      columnfromName: campaign.fromName,
      columnfromEmail: campaign.fromEmail,

    });
  }

  Future<List<EmailCampaign>> getStudents() async {
    final db = await database;
   final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
        maps.length,
        (index) => EmailCampaign(
            id: maps[index][columnId],
            subject: maps[index][columnSubject],
            previewtext: maps[index][columnpreviewText],
            fromName: maps[index][columnfromName],
            fromEmail: maps[index][columnfromEmail],
       ));
  }
}
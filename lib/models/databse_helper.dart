
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
    _database = await _initDatabase();
    return _database!;
  }


  Future<Database> _initDatabase() async {
    return await openDatabase(
      'emailcampaign.db', 
      version: _databaseversion,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnSubject TEXT NOT NULL,
            $columnpreviewText TEXT NOT NULL,
            $columnfromName TEXT NOT NULL,
            $columnfromEmail TEXT NOT NULL
          )
        ''');
      },
    );
  }
  Future<int> insertCampaign(EmailCampaignData campaign) async {
    final db = await database;
    return await db.insert(table, {
      columnSubject: campaign.subject,
      columnpreviewText: campaign.previewText,
      columnfromName: campaign.fromName,
      columnfromEmail: campaign.fromEmail,

    });
  }

  Future<List<EmailCampaignData>> getCampaignDetails() async {
    final db = await database;
   final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
        maps.length,
        (index) => EmailCampaignData(
            id: maps[index][columnId],
            subject: maps[index][columnSubject],
            previewText: maps[index][columnpreviewText],
            fromName: maps[index][columnfromName],
            fromEmail: maps[index][columnfromEmail],
       ));
  }
}
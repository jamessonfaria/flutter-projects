import 'package:agenda_contato/helpers/contact_enum.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
    }
    return _db;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersion) async {
      await db.execute(
          "CREATE TABLE ${ContactEnum.CONTACT_TABLE} (${ContactEnum.ID_COLUMN} INTEGER PRIMARY KEY, "
              "${ContactEnum.NAME_COLUMN} TEXT, ${ContactEnum.EMAIL_COLUMN} TEXT, "
              "${ContactEnum.PHONE_COLUMN} TEXT, ${ContactEnum.IMG_COLUMN} TEXT)");
    });
  }
}

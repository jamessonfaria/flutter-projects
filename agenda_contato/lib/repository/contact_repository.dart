import 'package:agenda_contato/helpers/contact_enum.dart';
import 'package:agenda_contato/model/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:agenda_contato/helpers/contact_helper.dart';

class ContactRepository {
  ContactHelper _ch;

  ContactRepository() {
    this._ch = ContactHelper();
  }

  Future<Contact> saveContact(Contact contact) async {
    Database dbContact = await _ch.db;
    contact.id =
    await dbContact.insert(ContactEnum.CONTACT_TABLE, contact.toMap());
    return contact;
  }

  Future<Contact> getContact(int id) async {
    Database dbContact = await _ch.db;
    List<Map> maps = await dbContact.query(ContactEnum.CONTACT_TABLE,
        columns: [
          ContactEnum.ID_COLUMN,
          ContactEnum.NAME_COLUMN,
          ContactEnum.EMAIL_COLUMN,
          ContactEnum.PHONE_COLUMN,
          ContactEnum.IMG_COLUMN
        ],
        where: "${ContactEnum.ID_COLUMN} = ?",
        whereArgs: [id]);

    if (maps.length > 0) return Contact.fromMap(maps.first);

    return null;
  }

  Future<int> deleteContact(int id) async {
    Database dbContact = await _ch.db;
    return await dbContact.delete(ContactEnum.CONTACT_TABLE,
        where: "${ContactEnum.ID_COLUMN} = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    Database dbContact = await _ch.db;
    return await dbContact.update(ContactEnum.CONTACT_TABLE, contact.toMap(),
        where: "${ContactEnum.ID_COLUMN} = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database dbContact = await _ch.db;
    List listMap =
    await dbContact.rawQuery("SELECT * FROM ${ContactEnum.CONTACT_TABLE}");
    List<Contact> listContacts = List();
    for (Map m in listMap) {
      listContacts.add(Contact.fromMap(m));
    }

    return listContacts;
  }

  Future<int> getNumber() async {
    Database dbContact = await _ch.db;
    return Sqflite.firstIntValue(await dbContact.rawQuery("SELECT COUNT(1) FROM ${ContactEnum.CONTACT_TABLE}"));
  }

  Future close() async {
    Database dbContact = await _ch.db;
    dbContact.close();
  }
}

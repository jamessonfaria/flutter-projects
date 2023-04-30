import 'package:agenda_contato/helpers/contact_enum.dart';

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact();

  Contact.fromMap(Map map){
    id = map[ContactEnum.ID_COLUMN];
    name = map[ContactEnum.NAME_COLUMN];
    email = map[ContactEnum.EMAIL_COLUMN];
    phone = map[ContactEnum.PHONE_COLUMN];
    img = map[ContactEnum.IMG_COLUMN];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      ContactEnum.NAME_COLUMN: name,
      ContactEnum.EMAIL_COLUMN: email,
      ContactEnum.PHONE_COLUMN: phone,
      ContactEnum.IMG_COLUMN: img
    };
    if(id != null)
      map[ContactEnum.ID_COLUMN] = id;

    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }


}
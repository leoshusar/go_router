import 'role.dart';

class User {
  User(this.id, this.name, this.birthDate, this.roles);

  int id;
  String name;
  DateTime birthDate;
  List<Role> roles;
}

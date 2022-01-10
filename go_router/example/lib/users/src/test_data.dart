import 'package:collection/collection.dart';

import 'models/role.dart';
import 'models/user.dart';

class TestData {
  static final users = [
    User(1, 'John Doe',
      DateTime(1970, 3, 20),
      [
        Role('invoices', ['read']),
        Role('attendance', ['read', 'write']),
      ],
    ),
    User(2, 'Gordon Freeman',
      DateTime(1970, 3, 20),
      [
        Role('invoices', ['read', 'write']),
        Role('management', ['read', 'write']),
        Role('attendance', ['read', 'write', 'update']),
      ],
    ),
  ];

  static User? getUserById(int id) =>
    users.firstWhereOrNull((u) => u.id == id);
}

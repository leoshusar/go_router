import 'package:collection/collection.dart';

import '../models/role.dart';
import '../test_data.dart';

class RoleBloc {
  RoleBloc(int userId, String roleId)
    : role = TestData
        .getUserById(userId)!.roles
        .firstWhereOrNull((r) => r.name == roleId);

  Role? role;
}

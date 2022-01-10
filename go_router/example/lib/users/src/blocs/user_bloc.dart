import '../models/user.dart';
import '../test_data.dart';

class UserBloc {
  UserBloc(int userId)
    : user = TestData.getUserById(userId);

  final User? user;
}

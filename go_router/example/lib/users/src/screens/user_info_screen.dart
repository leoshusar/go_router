import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late final _user = context.read<UserBloc>().user!;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: ${_user.name}'),
          Text('Birthdate: ${_user.birthDate}'),
        ],
      ),
    ),
  );
}

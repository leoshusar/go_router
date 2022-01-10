import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';

class UserRolesScreen extends StatefulWidget {
  const UserRolesScreen({Key? key}) : super(key: key);

  @override
  State<UserRolesScreen> createState() => _UserRolesScreenState();
}

class _UserRolesScreenState extends State<UserRolesScreen> {
  late final _user = context.read<UserBloc>().user!;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView.builder(
      itemCount: _user.roles.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_user.roles[index].name),
        onTap: () => context.go('/users/${_user.id}/roles/${_user.roles[index].name}'),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/role_bloc.dart';
import '../blocs/user_bloc.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  late final _user = context.read<UserBloc>().user!;
  late final _role = context.read<RoleBloc>().role;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_role == null ? 'Error' : '${_user.name} role permissions'),
    ),
    body: _role == null
      ? const Text('Role not found')
      : ListView.builder(
          itemCount: _role!.permissions.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(_role!.permissions[index]),
          ),
        ),
  );
}

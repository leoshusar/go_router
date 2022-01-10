import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';
import 'user_info_screen.dart';
import 'user_roles_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    required this.tab,
    Key? key,
  }) : super(key: key);

  final String tab;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
  with SingleTickerProviderStateMixin
{
  late final _tabController = TabController(length: 2, vsync: this);
  late final _user = context.read<UserBloc>().user;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_user == null ? 'Error' : _user!.name),
      bottom: TabBar(
        controller: _tabController,
        onTap: (index) {
          switch (index) {
            case 1:
              context.go('/users/${_user!.id}/info');
              break;
            case 0:
            default:
              context.go('/users/${_user!.id}/roles');
              break;
          }
        },
        tabs: const [
          Tab(text: 'Roles'),
          Tab(text: 'Info'),
        ],
      ),
    ),
    body: _user == null
      ? const Text('User not found.')
      : TabBarView(
          controller: _tabController,
          children: const [
            UserRolesScreen(),
            UserInfoScreen(),
          ],
        ),
  );
}

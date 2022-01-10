import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../test_data.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Users'),
    ),
    body: ListView.builder(
      itemCount: TestData.users.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(TestData.users[index].name),
        onTap: () => context.go('/users/${TestData.users[index].id}'),
      ),
    ),
  );
}

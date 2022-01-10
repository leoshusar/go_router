import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'blocs/role_bloc.dart';
import 'blocs/user_bloc.dart';
import 'screens/role_screen.dart';
import 'screens/user_screen.dart';
import 'screens/users_screen.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => '/users'
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => const UsersScreen(),
        routes: [
          GoRoute(
            path: ':userId',
            redirect: (state) => '/users/${state.params['userId']}/roles',
            // UserBloc with the current user will be available
            // for all subsequent routes..
            navigatorBuilder: (context, state, child) => Provider(
              create: (_) => UserBloc(int.parse(state.params['userId']!)),
              child: child,
            ),
            routes: [
              GoRoute(
                path: 'roles',
                pageBuilder: (context, state) => const MaterialPage<void>(
                  key: ValueKey('/users/:userId'),
                  child: UserScreen(tab: 'roles'),
                ),
                routes: [
                  GoRoute(
                    path: ':roleId',
                    builder: (context, state) {
                      final userId = int.parse(state.params['userId']!);
                      final roleId = state.params['roleId']!;
                      return Provider(
                        create: (_) => RoleBloc(userId, roleId),
                        child: const RoleScreen(),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'info',
                pageBuilder: (context, state) => const MaterialPage<void>(
                  key: ValueKey('/users/:userId'),
                  child: UserScreen(tab: 'info'),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

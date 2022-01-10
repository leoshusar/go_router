// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'src/router.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routeInformationParser: _router.router.routeInformationParser,
    routerDelegate: _router.router.routerDelegate,
  );
}

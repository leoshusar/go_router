import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTest extends StatelessWidget {
  const ProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Text(context.read<String>()),
        Text('bookId: ${context.read<int>()}'),
      ],
    ),
  );
}

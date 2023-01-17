import 'package:flutter/material.dart';

class WinRate extends StatelessWidget {
  final int runs;
  final int earendRuns;

  const WinRate({
    Key? key,
    required this.runs,
    required this.earendRuns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Win Rate')),
    );
  }
}

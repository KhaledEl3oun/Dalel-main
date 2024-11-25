import 'package:flutter/material.dart';

class BazarView extends StatefulWidget {
  const BazarView({super.key});

  @override
  State<BazarView> createState() => _BazarViewState();
}

class _BazarViewState extends State<BazarView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("BazarView"),),
    );
  }
}
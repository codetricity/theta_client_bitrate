import 'package:flutter/material.dart';

class XScreen extends StatefulWidget {
  const XScreen({super.key});

  @override
  State<XScreen> createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X-specific options'),
      ),
      body: const Column(
        children: [Text('for X firmware tests')],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Inbox',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

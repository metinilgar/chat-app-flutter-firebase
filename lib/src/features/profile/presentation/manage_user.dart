import 'package:flutter/material.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage User'),
      ),
      body: const Center(
        child: Text('Manage User'),
      ),
    );
  }
}

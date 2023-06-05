import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[Text('UserListScreen')],
      ),
    );
  }
}

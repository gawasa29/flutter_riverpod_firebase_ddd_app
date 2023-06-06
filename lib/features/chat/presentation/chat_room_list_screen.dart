import 'package:flutter/material.dart';

class ChatRoomListScreen extends StatelessWidget {
  const ChatRoomListScreen({super.key});
  static const routeName = 'ChatRoomList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[Text('ChatRoomListScreen')],
      ),
    );
  }
}

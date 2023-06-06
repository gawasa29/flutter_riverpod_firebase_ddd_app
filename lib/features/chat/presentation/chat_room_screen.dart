import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({
    super.key,
    required this.userId,
  });

  final String userId;
  static const routeName = 'ChatRoom';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(userId),
          const Expanded(
            child: SizedBox(),
          ),
          const _RoomMessageInput(),
          Container(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}

class _RoomMessageInput extends StatelessWidget {
  const _RoomMessageInput();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.image),
          onPressed: () {},
        ),
        Expanded(
          child: TextFormField(
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
      ],
    );
  }
}

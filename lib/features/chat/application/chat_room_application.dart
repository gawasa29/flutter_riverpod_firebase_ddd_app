import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/i_chat_room.dart';

class ChatRoomApplicationService {
  ChatRoomApplicationService({
    required this.chatRoomManager,
  });

  final IChatRoomService chatRoomManager;
}

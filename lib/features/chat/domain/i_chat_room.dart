import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/chat_room_entity.dart';

abstract class IChatRoomService {
  Future<void> createChatRoom();
  Future<ChatRoomEntity> readChatRoom();
  Future<void> updateChatRoom();
}

import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/chat_room_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/i_chat_room.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/infrastructure/repos/chat_room_repo.dart';

class ChatRoomImpl extends IChatRoomService {
  ChatRoomImpl({
    required this.repo,
  });
  final ChatRoomRepository repo;
  @override
  Future<void> createChatRoom() {
    // TODO: implement createChatRoom
    throw UnimplementedError();
  }

  @override
  Future<ChatRoomEntity> readChatRoom() {
    // TODO: implement readChatRoom
    throw UnimplementedError();
  }

  @override
  Future<void> updateChatRoom() {
    // TODO: implement updateChatRoom
    throw UnimplementedError();
  }
}

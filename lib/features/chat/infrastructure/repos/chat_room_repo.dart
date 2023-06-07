import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/chat_room_entity.dart';

class ChatRoomRepository {
  ChatRoomRepository({
    required this.ssot,
  });
  final CollectionReference<ChatRoomEntity> ssot;
}

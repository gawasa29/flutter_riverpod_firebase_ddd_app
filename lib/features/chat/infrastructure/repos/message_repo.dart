import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/message_entity.dart';

class MessageRepository {
  MessageRepository({
    required this.ssot,
  });
  final CollectionReference<MessageEntity> ssot;
}

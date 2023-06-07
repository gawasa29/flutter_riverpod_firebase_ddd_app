import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/message_entity.dart';

abstract class IMessageService {
  Future<void> sendMessage();
  Future<MessageEntity> readMessage();
}

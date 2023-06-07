import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/i_message.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/message_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/infrastructure/repos/message_repo.dart';

class MessageImpl extends IMessageService {
  MessageImpl({
    required this.repo,
  });
  final MessageRepository repo;
  @override
  Future<MessageEntity> readMessage() {
    // TODO: implement readMessage
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage() {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}

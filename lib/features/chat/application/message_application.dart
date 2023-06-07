import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/i_message.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/domain/message_entity.dart';

class MessageApplicationService {
  MessageApplicationService({
    required this.messageManager,
  });

  final IMessageService messageManager;

  Future<MessageEntity> readMessage() {
    print('🐯 MessageApplication readMessage IN !!! ');
    try {
      return messageManager.readMessage();
    } catch (e) {
      print('🐯 readMessage  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> sendMessage() {
    print('🐯 MessageApplication sendMessage IN !!! ');
    try {
      return messageManager.sendMessage();
    } catch (e) {
      print('🐯 sendMessage  失敗 !!! ');
      rethrow;
    }
  }
}

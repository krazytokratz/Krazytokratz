import 'package:flutter/foundation.dart';

enum MessageSender {
  user,
  kraz,
}

@immutable
class ChatMessage {
  final String id;
  final String text;
  final MessageSender sender;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.sender,
    required this.timestamp,
  });

  bool get isUser => sender == MessageSender.user;

  bool get isKraz => sender == MessageSender.kraz;

  ChatMessage copyWith({
    String? id,
    String? text,
    MessageSender? sender,
    DateTime? timestamp,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  String toString() {
    return 'ChatMessage('
        'id: $id, '
        'sender: $sender, '
        'text: $text'
        ')';
  }
}
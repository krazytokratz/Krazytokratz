class ConversationTurn {
  final String userMessage;

  final String assistantMessage;

  final DateTime timestamp;

  final List<String> topics;

  ConversationTurn({
    required this.userMessage,
    required this.assistantMessage,
    required this.timestamp,
    required this.topics,
  });

  factory ConversationTurn.user(
    String message,
  ) {
    return ConversationTurn(
      userMessage: message,
      assistantMessage: "",
      timestamp: DateTime.now(),
      topics: [],
    );
  }

  ConversationTurn copyWith({
    String? userMessage,
    String? assistantMessage,
    DateTime? timestamp,
    List<String>? topics,
  }) {
    return ConversationTurn(
      userMessage:
          userMessage ?? this.userMessage,
      assistantMessage:
          assistantMessage ??
              this.assistantMessage,
      timestamp:
          timestamp ?? this.timestamp,
      topics:
          topics ?? this.topics,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userMessage": userMessage,
      "assistantMessage":
          assistantMessage,
      "timestamp":
          timestamp.toIso8601String(),
      "topics": topics,
    };
  }

  factory ConversationTurn.fromJson(
    Map<String, dynamic> json,
  ) {
    return ConversationTurn(
      userMessage:
          json["userMessage"] ?? "",
      assistantMessage:
          json["assistantMessage"] ?? "",
      timestamp:
          DateTime.parse(
        json["timestamp"],
      ),
      topics:
          List<String>.from(
        json["topics"] ?? [],
      ),
    );
  }
}
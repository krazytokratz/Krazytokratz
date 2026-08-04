import 'conversation_turn.dart';

class ConversationSession {
  static const int maxHistory = 20;

  final List<ConversationTurn> _history = [];

  // ==========================================================
  // ADD USER MESSAGE
  // ==========================================================

  void addUserMessage(
    String message,
  ) {
    _history.add(
      ConversationTurn.user(
        message,
      ),
    );

    _trimHistory();
  }

  // ==========================================================
  // ADD ASSISTANT RESPONSE
  // ==========================================================

  void addAssistantResponse(
    String response,
  ) {
    if (_history.isEmpty) {
      return;
    }

    final last = _history.removeLast();

    _history.add(
      last.copyWith(
        assistantMessage: response,
      ),
    );
  }

  // ==========================================================
  // UPDATE TOPICS
  // ==========================================================

  void updateTopics(
    List<String> topics,
  ) {
    if (_history.isEmpty) {
      return;
    }

    final last = _history.removeLast();

    _history.add(
      last.copyWith(
        topics: topics,
      ),
    );
  }

  // ==========================================================
  // LAST TURN
  // ==========================================================

  ConversationTurn? get lastTurn {
    if (_history.isEmpty) {
      return null;
    }

    return _history.last;
  }

  // ==========================================================
  // GET HISTORY
  // ==========================================================

  List<ConversationTurn> get history =>
      List.unmodifiable(
        _history,
      );

  // ==========================================================
  // LAST USER MESSAGE
  // ==========================================================

  String get lastUserMessage {
    return lastTurn?.userMessage ?? "";
  }

  // ==========================================================
  // LAST ASSISTANT RESPONSE
  // ==========================================================

  String get lastAssistantResponse {
    return lastTurn?.assistantMessage ?? "";
  }

  // ==========================================================
  // LAST TOPICS
  // ==========================================================

  List<String> get lastTopics {
    return lastTurn?.topics ?? [];
  }

  // ==========================================================
  // CLEAR
  // ==========================================================

  void clear() {
    _history.clear();
  }

  // ==========================================================
  // HISTORY LIMIT
  // ==========================================================

  void _trimHistory() {
    while (_history.length > maxHistory) {
      _history.removeAt(0);
    }
  }
}
class WorkingMemory {
  static const int maxItems = 10;

  final List<String> _messages = [];

  void add(
    String message,
  ) {
    final text = message.trim();

    if (text.isEmpty) {
      return;
    }

    _messages.add(text);

    if (_messages.length > maxItems) {
      _messages.removeAt(0);
    }
  }

  List<String> get history =>
      List.unmodifiable(
        _messages,
      );

  String buildContext() {
    if (_messages.isEmpty) {
      return "";
    }

    final buffer = StringBuffer();

    buffer.writeln(
      "Recent Conversation:\n",
    );

    for (final item in _messages) {
      buffer.writeln(
        "• $item",
      );
    }

    return buffer.toString();
  }

  void clear() {
    _messages.clear();
  }
}
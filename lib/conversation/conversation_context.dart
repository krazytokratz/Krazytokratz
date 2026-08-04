import 'working_memory.dart';

class ConversationContext {
  final WorkingMemory memory =
      WorkingMemory();

  void addUser(
    String message,
  ) {
    memory.add(
      "User : $message",
    );
  }

  void addAssistant(
    String message,
  ) {
    memory.add(
      "Kraz : $message",
    );
  }

  String build() {
    return memory.buildContext();
  }

  void clear() {
    memory.clear();
  }
}
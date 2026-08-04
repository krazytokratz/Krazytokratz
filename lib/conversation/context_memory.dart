import 'context_state.dart';
import 'context_topic.dart';

class ContextMemory {
  final ContextState state =
      ContextState();

  void remember(
    ContextTopic topic,
  ) {
    state.update(
      topic,
    );
  }

  ContextTopic? recall() {
    return state.activeTopic;
  }

  ContextTopic? previous() {
    return state.previousTopic();
  }

  List<ContextTopic> history() {
    return List.unmodifiable(
      state.history,
    );
  }

  void clear() {
    state.clear();
  }
}
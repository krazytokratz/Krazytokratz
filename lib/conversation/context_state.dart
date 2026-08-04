import 'context_topic.dart';

class ContextState {
  ContextTopic? activeTopic;

  final List<ContextTopic> history =
      [];

  void update(
    ContextTopic topic,
  ) {
    activeTopic = topic;

    history.removeWhere(
      (item) =>
          item.name ==
          topic.name,
    );

    history.insert(
      0,
      topic,
    );

    if (history.length > 20) {
      history.removeLast();
    }
  }

  ContextTopic? previousTopic() {
    if (history.length < 2) {
      return null;
    }

    return history[1];
  }

  void clear() {
    activeTopic = null;

    history.clear();
  }
}
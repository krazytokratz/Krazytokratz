import 'context_topic.dart';

class ContextRanker {
  ContextTopic? getBestTopic(
    List<ContextTopic> topics,
  ) {
    if (topics.isEmpty) {
      return null;
    }

    topics.sort(
      (a, b) =>
          b.score.compareTo(
        a.score,
      ),
    );

    return topics.first;
  }

  List<ContextTopic> rank(
    List<ContextTopic> topics,
  ) {
    final result =
        List<ContextTopic>.from(
      topics,
    );

    result.sort(
      (a, b) =>
          b.score.compareTo(
        a.score,
      ),
    );

    return result;
  }

  bool hasTopic(
    List<ContextTopic> topics,
  ) {
    return topics.isNotEmpty;
  }
}
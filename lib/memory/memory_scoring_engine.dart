import 'intelligent_memory.dart';
import 'memory_score.dart';
import 'keyword_analyzer.dart';
import 'keyword_weight.dart';

class MemoryScoringEngine {
  final KeywordAnalyzer analyzer =
      KeywordAnalyzer();

  List<MemoryScore> score(
    String message,
    List<IntelligentMemory> memories,
  ) {
    final keywords =
        analyzer.analyze(message);

    final result =
        <MemoryScore>[];

    for (final memory in memories) {
      final score =
          _calculateScore(
        memory,
        keywords,
      );

      if (score > 0) {
        result.add(
          MemoryScore(
            content: memory.content,
            category: memory.category,
            score: score,
          ),
        );
      }
    }

    result.sort(
      (a, b) =>
          b.score.compareTo(
        a.score,
      ),
    );

    return result;
  }

  double _calculateScore(
    IntelligentMemory memory,
    List<KeywordWeight> keywords,
  ) {
    final text =
        memory.content.toLowerCase();

    double score = 0;

    for (final keyword in keywords) {
      if (text.contains(
        keyword.keyword,
      )) {
        score += keyword.weight;
      }
    }

    return score;
  }

  List<MemoryScore> top(
    List<MemoryScore> scores, {
    int limit = 5,
  }) {
    if (scores.length <= limit) {
      return scores;
    }

    return scores
        .take(limit)
        .toList();
  }
}
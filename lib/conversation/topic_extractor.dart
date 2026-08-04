import 'context_topic.dart';

class TopicExtractor {
  final List<String> _keywords = [
    "kraz",
    "flutter",
    "dart",
    "openai",
    "chatgpt",
    "ai",
    "memory",
    "project",
    "proyek",
    "aplikasi",
    "perusahaan",
    "pt",
    "hr",
    "consultant",
    "trainer",
    "android",
    "ios",
    "database",
    "pegawai",
    "karyawan",
  ];

  List<ContextTopic> extract(
    String text,
  ) {
    final lower =
        text.toLowerCase();

    final List<ContextTopic> topics = [];

    for (final keyword in _keywords) {
      if (lower.contains(keyword)) {
        topics.add(
          ContextTopic(
            name: keyword,
            score: _calculateScore(
              keyword,
              lower,
            ),
            updatedAt: DateTime.now(),
          ),
        );
      }
    }

    topics.sort(
      (a, b) =>
          b.score.compareTo(
        a.score,
      ),
    );

    return topics;
  }

  double _calculateScore(
    String keyword,
    String sentence,
  ) {
    double score = 1.0;

    final count =
        keyword.allMatches(
      sentence,
    ).length;

    score += count;

    if (sentence.startsWith(keyword)) {
      score += 2;
    }

    if (sentence.contains(
      "sedang",
    )) {
      score += 0.5;
    }

    if (sentence.contains(
      "membuat",
    )) {
      score += 0.5;
    }

    if (sentence.contains(
      "mengembangkan",
    )) {
      score += 0.5;
    }

    return score;
  }
}
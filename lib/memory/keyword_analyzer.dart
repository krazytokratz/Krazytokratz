import 'keyword_weight.dart';

class KeywordAnalyzer {
  static const Set<String> stopWords = {
    "yang",
    "dan",
    "di",
    "ke",
    "dari",
    "untuk",
    "adalah",
    "itu",
    "ini",
    "apa",
    "siapa",
    "bagaimana",
    "kapan",
    "dimana",
    "dengan",
    "atau",
    "karena",
    "sebagai",
    "saya",
    "kamu",
  };

  List<KeywordWeight> analyze(
    String message,
  ) {
    final words =
        message
            .toLowerCase()
            .split(RegExp(r"\s+"));

    final result =
        <KeywordWeight>[];

    for (final word in words) {
      final text = word.trim();

      if (text.isEmpty) {
        continue;
      }

      if (stopWords.contains(text)) {
        continue;
      }

      double weight = 1;

      if (text.length >= 8) {
        weight = 2;
      }

      if (text.length >= 12) {
        weight = 3;
      }

      result.add(
        KeywordWeight(
          keyword: text,
          weight: weight,
        ),
      );
    }

    return result;
  }
}
import 'intelligent_memory.dart';
import 'intelligent_memory_repository.dart';
import 'memory_score.dart';
import 'memory_scoring_engine.dart';

class IntelligentMemoryRetriever {
  final IntelligentMemoryRepository repository =
      IntelligentMemoryRepository();

  final MemoryScoringEngine scoringEngine =
      MemoryScoringEngine();

  Future<void> initialize() async {
    await repository.load();
  }

  Future<String?> recallIdentity() async {
    return _recallCategory(
      "Identity",
    );
  }

  Future<String?> recallProject() async {
    return _recallCategory(
      "Project",
    );
  }

  Future<String?> recallPreference() async {
    return _recallCategory(
      "Preference",
    );
  }

  Future<String?> recallLearning() async {
    return _recallCategory(
      "Learning",
    );
  }

  Future<String?> recallAll() async {
    await repository.load();

    final memories =
        repository.getAll();

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      "Yang saya ingat tentang Anda",
      memories,
    );
  }

  Future<String?> recallRelevant(
    String message,
  ) async {
    await repository.load();

    final scores =
        scoringEngine.score(
      message,
      repository.getAll(),
    );

    final top =
        scoringEngine.top(
      scores,
      limit: 5,
    );

    if (top.isEmpty) {
      return null;
    }

    final buffer =
        StringBuffer();

    buffer.writeln(
      "Informasi yang paling relevan:\n",
    );

    for (final MemoryScore item
        in top) {
      buffer.writeln(
        "• ${item.content}",
      );
    }

    return buffer.toString();
  }

  Future<String?> _recallCategory(
    String category,
  ) async {
    await repository.load();

    final memories =
        repository.findByCategory(
      category,
    );

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      category,
      memories,
    );
  }

  String _buildSummary(
    String title,
    List<IntelligentMemory> memories,
  ) {
    final buffer =
        StringBuffer();

    buffer.writeln(
      "$title:\n",
    );

    for (final memory
        in memories) {
      buffer.writeln(
        "• ${memory.content}",
      );
    }

    return buffer.toString();
  }
}
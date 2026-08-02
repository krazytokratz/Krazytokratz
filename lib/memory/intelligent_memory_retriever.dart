import 'intelligent_memory.dart';
import 'intelligent_memory_repository.dart';

class IntelligentMemoryRetriever {
  final IntelligentMemoryRepository repository =
      IntelligentMemoryRepository();

  Future<void> initialize() async {
    await repository.load();
  }

  Future<String?> recallIdentity() async {
    await repository.load();

    final memories =
        repository.findByCategory("Identity");

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      "Identity",
      memories,
    );
  }

  Future<String?> recallProject() async {
    await repository.load();

    final memories =
        repository.findByCategory("Project");

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      "Project",
      memories,
    );
  }

  Future<String?> recallPreference() async {
    await repository.load();

    final memories =
        repository.findByCategory("Preference");

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      "Preference",
      memories,
    );
  }

  Future<String?> recallLearning() async {
    await repository.load();

    final memories =
        repository.findByCategory("Learning");

    if (memories.isEmpty) {
      return null;
    }

    return _buildSummary(
      "Learning",
      memories,
    );
  }

  Future<String?> recallAll() async {
    await repository.load();

    final memories =
        repository.getAll();

    if (memories.isEmpty) {
      return null;
    }

    final buffer = StringBuffer();

    buffer.writeln(
      "Berikut yang saya ingat tentang Anda:\n",
    );

    for (final memory in memories) {
      buffer.writeln(
        "• ${memory.content}",
      );
    }

    return buffer.toString();
  }

  String _buildSummary(
    String category,
    List<IntelligentMemory> memories,
  ) {
    final buffer = StringBuffer();

    buffer.writeln(
      "Yang saya ingat pada kategori $category:\n",
    );

    for (final memory in memories) {
      buffer.writeln(
        "• ${memory.content}",
      );
    }

    return buffer.toString();
  }
}
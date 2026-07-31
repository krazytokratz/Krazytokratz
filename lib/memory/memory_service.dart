import 'memory_model.dart';
import 'memory_priority.dart';
import 'memory_category.dart';


class MemoryService {

  final List<Memory> _memories = [];


  // Menyimpan memory baru
  void saveMemory(Memory memory) {

    _memories.add(memory);

  }


  // Mengambil semua memory
  List<Memory> getAllMemories() {

    return List.unmodifiable(_memories);

  }


  // Mencari memory berdasarkan kategori
  List<Memory> findByCategory(
      MemoryCategory category
  ) {

    return _memories
        .where(
          (memory) =>
              memory.category == category,
        )
        .toList();

  }


  // Mengambil memory berdasarkan tingkat kepentingan
  List<Memory> getImportantMemories(
      MemoryPriority minimumPriority
  ) {

    final minimumScore =
        MemoryPriorityConfig.getScore(
            minimumPriority
        );


    return _memories
        .where(
          (memory) =>
              memory.importance >= minimumScore,
        )
        .toList();

  }


  // Pencarian berdasarkan kata kunci
  List<Memory> search(
      String keyword
  ) {

    return _memories
        .where(
          (memory) =>
              memory.content
                  .toLowerCase()
                  .contains(
                    keyword.toLowerCase(),
                  ),
        )
        .toList();

  }


  // Menghapus memory berdasarkan ID
  void deleteMemory(
      String id
  ) {

    _memories.removeWhere(
      (memory) =>
          memory.id == id,
    );

  }


  // Menghapus seluruh memory
  void clearAll() {

    _memories.clear();

  }


  // Jumlah memory
  int get memoryCount {

    return _memories.length;

  }


  // Apakah kosong?
  bool get isEmpty {

    return _memories.isEmpty;

  }


  // Apakah memiliki isi?
  bool get isNotEmpty {

    return _memories.isNotEmpty;

  }

}
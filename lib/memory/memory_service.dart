import 'memory_model.dart';
import 'memory_priority.dart';


class MemoryService {

  // Temporary memory storage
  final List<Memory> _memories = [];


  /*
   * Menyimpan memory baru
   */
  void saveMemory(Memory memory) {

    _memories.add(memory);

  }


  /*
   * Mengambil seluruh memory
   */
  List<Memory> getAllMemories() {

    return List.unmodifiable(_memories);

  }


  /*
   * Mencari memory berdasarkan kategori
   */
  List<Memory> findByCategory(String category) {

    return _memories
        .where(
          (memory) =>
              memory.category.toLowerCase()
              ==
              category.toLowerCase(),
        )
        .toList();

  }


  /*
   * Mengambil memory berdasarkan tingkat kepentingan
   */
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


  /*
   * Mencari memory berdasarkan kata kunci
   */
  List<Memory> search(String keyword) {

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


  /*
   * Menghapus memory berdasarkan ID
   */
  void deleteMemory(String id) {

    _memories.removeWhere(
      (memory) =>
          memory.id == id,
    );

  }


  /*
   * Menghapus seluruh memory
   */
  void clearAll() {

    _memories.clear();

  }


  /*
   * Jumlah memory tersimpan
   */
  int get memoryCount {

    return _memories.length;

  }


  /*
   * Mengecek apakah memory kosong
   */
  bool get isEmpty {

    return _memories.isEmpty;

  }


  /*
   * Mengecek apakah memory tersedia
   */
  bool get isNotEmpty {

    return _memories.isNotEmpty;

  }

}
import 'memory_model.dart';
import 'memory_priority.dart';
import 'memory_category.dart';
import 'memory_storage.dart';



class MemoryService {


  final List<Memory> _memories = [];


  final MemoryStorage storage =
      MemoryStorage();




  void saveMemory(
      Memory memory
  ) {

    _memories.add(memory);

  }





  List<Memory> getAllMemories() {

    return List.unmodifiable(
      _memories,
    );

  }






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






  void deleteMemory(
      String id
  ) {


    _memories.removeWhere(

      (memory) =>
          memory.id == id,

    );


  }






  void clearAll() {

    _memories.clear();

    storage.clear();

  }







  int get memoryCount {

    return _memories.length;

  }







  bool get isEmpty {

    return _memories.isEmpty;

  }







  bool get isNotEmpty {

    return _memories.isNotEmpty;

  }







  // ============================
  // KRAZ PERSONAL MEMORY
  // ============================



  void remember(
      String key,
      String value,
  ) {


    storage.save(
      key,
      value,
    );


  }







  String? recall(
      String key,
  ) {


    return storage.read(
      key,
    );


  }







  bool knows(
      String key,
  ) {


    return storage.contains(
      key,
    );


  }



}
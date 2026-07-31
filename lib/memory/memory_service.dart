import 'package:flutter/foundation.dart';

import 'memory_model.dart';
import 'memory_priority.dart';
import 'memory_category.dart';
import 'persistent_memory.dart';
import 'memory_intelligence.dart';



class MemoryService {


  final List<Memory> _memories = [];


  final PersistentMemory persistentMemory =
      PersistentMemory();



  final MemoryIntelligence intelligence =
      MemoryIntelligence();






  // ==========================
  // SMART MEMORY SAVE
  // ==========================


  void saveMemory(

    Memory memory,

  ) {


    final exists =
        intelligence.existsSimilar(
          _memories,
          memory.content,
        );



    if(exists) {


      debugPrint(
        "Kraz Memory duplicate detected",
      );


      return;

    }



    _memories.add(
      memory,
    );


  }







  List<Memory> getAllMemories() {


    return List.unmodifiable(
      _memories,
    );


  }







  List<Memory> findByCategory(

    MemoryCategory category,

  ) {


    return intelligence.filterByCategory(

      _memories,

      category,

    );


  }







  List<Memory> getImportantMemories(

    MemoryPriority minimumPriority,

  ) {


    final minimumScore =

        MemoryPriorityConfig.getScore(

          minimumPriority,

        );



    return _memories

        .where(

          (memory) =>

              memory.importance >= minimumScore,

        )

        .toList();


  }







  List<Memory> search(

    String keyword,

  ) {


    return intelligence.search(

      _memories,

      keyword,

    );


  }







  Memory? getMostRelevant(

    List<Memory> memories,

  ) {


    return intelligence.getMostRelevant(

      memories,

    );


  }







  void deleteMemory(

    String id,

  ) {


    _memories.removeWhere(

      (memory) =>

          memory.id == id,

    );


  }







  Future<void> clearAll() async {


    _memories.clear();


    await persistentMemory.clear();


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









  // ==========================
  // KRAZ LONG TERM MEMORY
  // ==========================


  Future<void> remember(

    String key,

    String value,

  ) async {


    await persistentMemory.save(

      key,

      value,

    );


  }







  Future<String?> recall(

    String key,

  ) async {


    return await persistentMemory.read(

      key,

    );


  }







  Future<bool> knows(

    String key,

  ) async {


    return await persistentMemory.exists(

      key,

    );


  }







  // ==========================
  // LOAD MEMORY WHEN STARTING
  // ==========================


  Future<void> loadMemory() async {


    final savedName =

        await recall(

          "user_name",

        );



    if(

      savedName != null &&

      savedName.isNotEmpty

    ) {


      debugPrint(

        "Kraz remembers user: $savedName",

      );


    }


  }



}
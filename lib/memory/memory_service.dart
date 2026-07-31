import 'package:flutter/foundation.dart';

import 'memory_model.dart';
import 'memory_priority.dart';
import 'memory_category.dart';
import 'persistent_memory.dart';
import 'memory_intelligence.dart';
import 'memory_storage.dart';



class MemoryService {


  final List<Memory> _memories = [];



  final PersistentMemory persistentMemory =
      PersistentMemory();



  final MemoryStorage storage =
      MemoryStorage();



  final MemoryIntelligence intelligence =
      MemoryIntelligence();







  // ==========================
  // INITIALIZE MEMORY SYSTEM
  // ==========================


  Future<void> initialize() async {


    final storedMemories =
        await storage.load();



    _memories.clear();



    _memories.addAll(
      storedMemories,
    );



    debugPrint(

      "Kraz loaded ${_memories.length} memories",

    );


  }









  // ==========================
  // SMART MEMORY SAVE
  // ==========================


  Future<void> saveMemory(

    Memory memory,

  ) async {


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



    await storage.save(

      _memories,

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









  Future<void> deleteMemory(

    String id,

  ) async {


    _memories.removeWhere(

      (memory) =>

          memory.id == id,

    );



    await storage.save(

      _memories,

    );


  }









  Future<void> clearAll() async {


    _memories.clear();



    await storage.clear();



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
  // KRAZ LONG TERM KEY MEMORY
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
  // LOAD USER MEMORY
  // ==========================


  Future<void> loadMemory() async {


    await initialize();



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
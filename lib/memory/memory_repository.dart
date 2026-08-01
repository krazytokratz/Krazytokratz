import 'memory_model.dart';
import 'memory_category.dart';
import 'memory_service.dart';
import 'persistent_memory.dart';


class MemoryRepository {


  final MemoryService memoryService;

  final PersistentMemory persistentMemory;



  MemoryRepository({

    required this.memoryService,

    required this.persistentMemory,

  });



  Future<void> saveMemory(
    Memory memory,
  ) async {


    memoryService.saveMemory(
      memory,
    );


    await persistentMemory.save(
      memory.id,
      memory.content,
    );


  }




  List<Memory> getMemories() {


    return memoryService.getAllMemories();


  }




  List<Memory> findByCategory(
    MemoryCategory category,
  ) {


    return memoryService.findByCategory(
      category,
    );


  }




  Future<String?> recall(
    String id,
  ) async {


    return await persistentMemory.read(
      id,
    );


  }




  Future<void> delete(
    String id,
  ) async {


    memoryService.deleteMemory(
      id,
    );


    await persistentMemory.save(
      id,
      "",

    );


  }




  Future<void> clearAll() async {


    await memoryService.clearAll();


  }




  Future<void> loadMemory() async {


    // Future:
    // Restore memory JSON
    // dari PersistentMemory
    // ke MemoryService


  }


}
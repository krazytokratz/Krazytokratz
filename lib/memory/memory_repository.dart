import 'memory_model.dart';
import 'memory_category.dart';
import 'memory_service.dart';
import 'persistent_memory.dart';





class MemoryRepository {



  final MemoryService memoryService =
      MemoryService();



  final PersistentMemory persistentMemory =
      PersistentMemory();









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









  // ==========================
  // LOAD MEMORY
  // ==========================


  Future<void> loadMemory() async {


    /*
    
    Placeholder untuk memory restoration.

    Pada tahap berikutnya kita akan membuat
    PersistentMemory menyimpan daftar Memory
    lengkap dalam bentuk JSON.

    Struktur:

    Storage
       |
       ↓
    Memory List
       |
       ↓
    MemoryService

    */


  }







}
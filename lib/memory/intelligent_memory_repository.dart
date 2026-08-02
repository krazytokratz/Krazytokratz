import 'intelligent_memory.dart';
import 'intelligent_memory_storage.dart';





class IntelligentMemoryRepository {



  final IntelligentMemoryStorage storage =
      IntelligentMemoryStorage();




  List<IntelligentMemory> memories =
      [];









  // ==========================
  // LOAD MEMORY
  // ==========================


  Future<void> load() async {


    memories =

        await storage.loadMemory();


  }









  // ==========================
  // ADD MEMORY
  // ==========================


  Future<void> add(

    IntelligentMemory memory,

  ) async {


    memories.add(

      memory,

    );



    await storage.saveMemory(

      memories,

    );


  }









  // ==========================
  // GET ALL MEMORY
  // ==========================


  List<IntelligentMemory> getAll() {


    return memories;


  }









  // ==========================
  // FIND BY CATEGORY
  // ==========================


  List<IntelligentMemory> findByCategory(

    String category,

  ) {


    return memories

        .where(

          (memory) =>

              memory.category == category,

        )

        .toList();


  }









  // ==========================
  // FIND IMPORTANT MEMORY
  // ==========================


  List<IntelligentMemory> getImportant() {


    return memories

        .where(

          (memory) =>

              memory.importance == "High",

        )

        .toList();


  }









  // ==========================
  // CLEAR MEMORY
  // ==========================


  Future<void> clear() async {


    memories.clear();



    await storage.clearMemory();


  }







}
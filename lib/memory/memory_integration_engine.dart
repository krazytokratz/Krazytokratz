import 'memory_classifier.dart';

import 'intelligent_memory.dart';

import 'intelligent_memory_repository.dart';





class MemoryIntegrationEngine {



  final MemoryClassifier classifier =
      MemoryClassifier();




  final IntelligentMemoryRepository repository =
      IntelligentMemoryRepository();









  Future<void> initialize() async {


    await repository.load();


  }









  Future<bool> analyzeAndStore(

    String message,

  ) async {



    final memory =

        classifier.classify(

          message,

        );





    if(memory == null) {


      return false;


    }






    await repository.add(

      memory,

    );





    return true;


  }









  List<IntelligentMemory> getMemories() {


    return repository.getAll();


  }









  List<IntelligentMemory> getImportantMemories() {


    return repository.getImportant();


  }







}
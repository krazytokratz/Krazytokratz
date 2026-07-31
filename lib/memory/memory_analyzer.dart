import 'memory_category.dart';
import 'memory_priority.dart';


class MemoryAnalyzer {


  static MemoryCategory detectCategory(
      String text
  ) {


    final input =
        text.toLowerCase();


    if(input.contains("nama") ||
       input.contains("saya adalah")) {

      return MemoryCategory.identity;

    }


    if(input.contains("suka") ||
       input.contains("preferensi")) {

      return MemoryCategory.preference;

    }


    if(input.contains("project") ||
       input.contains("proyek")) {

      return MemoryCategory.project;

    }


    if(input.contains("kerjakan") ||
       input.contains("tugas")) {

      return MemoryCategory.task;

    }


    return MemoryCategory.conversation;

  }



  static MemoryPriority detectPriority(
      MemoryCategory category
  ) {


    switch(category) {


      case MemoryCategory.identity:

        return MemoryPriority.critical;


      case MemoryCategory.project:

        return MemoryPriority.high;


      case MemoryCategory.preference:

        return MemoryPriority.high;


      case MemoryCategory.knowledge:

        return MemoryPriority.medium;


      case MemoryCategory.task:

        return MemoryPriority.medium;


      case MemoryCategory.conversation:

        return MemoryPriority.low;


      case MemoryCategory.temporary:

        return MemoryPriority.low;

    }

  }

}
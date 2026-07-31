import 'memory_category.dart';


class Memory {

  final String id;

  final MemoryCategory category;

  final String content;

  final DateTime createdAt;

  final int importance;


  Memory({

    required this.id,

    required this.category,

    required this.content,

    required this.createdAt,

    required this.importance,

  });

}
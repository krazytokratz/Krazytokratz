class Memory {
  final String id;
  final String category;
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
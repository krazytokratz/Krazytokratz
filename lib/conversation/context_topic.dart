class ContextTopic {
  final String name;

  final double score;

  final DateTime updatedAt;

  ContextTopic({
    required this.name,
    required this.score,
    required this.updatedAt,
  });

  ContextTopic copyWith({
    String? name,
    double? score,
    DateTime? updatedAt,
  }) {
    return ContextTopic(
      name: name ?? this.name,
      score: score ?? this.score,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "score": score,
      "updatedAt": updatedAt.toIso8601String(),
    };
  }

  factory ContextTopic.fromJson(
    Map<String, dynamic> json,
  ) {
    return ContextTopic(
      name: json["name"] ?? "",
      score: (json["score"] ?? 0.0).toDouble(),
      updatedAt: DateTime.parse(
        json["updatedAt"],
      ),
    );
  }

  @override
  String toString() {
    return "$name ($score)";
  }
}
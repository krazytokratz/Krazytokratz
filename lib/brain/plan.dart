class Plan {
  final String goal;

  final List<String> steps;

  final bool completed;

  const Plan({
    required this.goal,
    required this.steps,
    this.completed = false,
  });

  int get totalSteps =>
      steps.length;

  Plan copyWith({
    String? goal,
    List<String>? steps,
    bool? completed,
  }) {
    return Plan(
      goal: goal ?? this.goal,
      steps: steps ?? this.steps,
      completed:
          completed ?? this.completed,
    );
  }
}
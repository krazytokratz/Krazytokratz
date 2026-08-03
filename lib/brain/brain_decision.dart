class BrainDecision {
  final bool useMemory;
  final bool useAI;
  final bool saveMemory;

  const BrainDecision({
    required this.useMemory,
    required this.useAI,
    required this.saveMemory,
  });

  factory BrainDecision.defaultDecision() {
    return const BrainDecision(
      useMemory: true,
      useAI: false,
      saveMemory: true,
    );
  }
}
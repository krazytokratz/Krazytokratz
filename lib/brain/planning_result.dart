import 'plan.dart';

class PlanningResult {
  final bool hasPlan;

  final Plan? plan;

  const PlanningResult({
    required this.hasPlan,
    this.plan,
  });
}
import 'prompt_strategy.dart';

class PromptContext {
  final PromptStrategy strategy;

  final String profile;

  final String memory;

  final String project;

  final String activeContext;

  final String lastMessage;

  final String currentMessage;

  const PromptContext({
    required this.strategy,
    required this.profile,
    required this.memory,
    required this.project,
    required this.activeContext,
    required this.lastMessage,
    required this.currentMessage,
  });
}
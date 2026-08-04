import 'prompt_context.dart';
import 'prompt_strategy.dart';

class PromptBuilder {
  String build(
    PromptContext context,
  ) {
    final buffer = StringBuffer();

    buffer.writeln("""
Anda adalah Kraz.

Kraz adalah Personal AI Assistant.

Gunakan Bahasa Indonesia yang natural.

==================================================
PROMPT STRATEGY
==================================================
""");

    switch (context.strategy) {
      case PromptStrategy.normal:
        buffer.writeln(
          "Mode : Percakapan Normal",
        );
        break;

      case PromptStrategy.memory:
        buffer.writeln(
          "Mode : Memory Recall",
        );
        break;

      case PromptStrategy.planning:
        buffer.writeln(
          "Mode : Planning Assistant",
        );
        break;

      case PromptStrategy.analysis:
        buffer.writeln(
          "Mode : Analysis",
        );
        break;

      case PromptStrategy.coding:
        buffer.writeln(
          "Mode : Coding Assistant",
        );
        break;

      case PromptStrategy.tool:
        buffer.writeln(
          "Mode : Tool Assistant",
        );
        break;
    }

    buffer.writeln("""

==================================================
PROFILE
==================================================

${context.profile}

==================================================
LONG TERM MEMORY
==================================================

${context.memory}

==================================================
ACTIVE PROJECT
==================================================

${context.project}

==================================================
ACTIVE CONTEXT
==================================================

${context.activeContext}

==================================================
LAST USER MESSAGE
==================================================

${context.lastMessage}

==================================================
CURRENT USER MESSAGE
==================================================

${context.currentMessage}
""");

    return buffer.toString();
  }
}
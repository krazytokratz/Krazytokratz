import '../memory/intelligent_memory_retriever.dart';

import 'conversation_context.dart';
import 'conversation_session.dart';
import 'reference_resolver.dart';
import 'topic_extractor.dart';

class ContextIntelligence {
  final IntelligentMemoryRetriever retriever =
      IntelligentMemoryRetriever();

  final ConversationSession session =
      ConversationSession();

  final ConversationContext workingMemory =
      ConversationContext();

  late final ReferenceResolver resolver;

  final TopicExtractor extractor =
      TopicExtractor();

  ContextIntelligence() {
    resolver = ReferenceResolver(
      session: session,
    );
  }

  Future<void> initialize() async {
    await retriever.initialize();
  }

  Future<String> buildContext(
    String message,
  ) async {
    // ==========================
    // Working Memory
    // ==========================

    workingMemory.addUser(
      message,
    );

    // ==========================
    // Conversation Session
    // ==========================

    session.addUserMessage(
      message,
    );

    final topics =
        extractor.extract(
      message,
    );

    session.updateTopics(
      topics
          .map((e) => e.name)
          .toList(),
    );

    final reference =
        resolver.resolve(
      message,
    );

    final relevantMemory =
        await retriever
            .recallRelevant(
      message,
    );

    final buffer =
        StringBuffer();

    if (reference.isNotEmpty) {
      buffer.writeln(
        "REFERENCE");
      buffer.writeln(
        reference,
      );
      buffer.writeln();
    }

    final working =
        workingMemory.build();

    if (working.isNotEmpty) {
      buffer.writeln(
        working,
      );
    }

    if (relevantMemory != null &&
        relevantMemory.isNotEmpty) {
      buffer.writeln(
        relevantMemory,
      );
    }

    return buffer.toString();
  }

  void registerResponse(
    String response,
  ) {
    session.addAssistantResponse(
      response,
    );

    workingMemory.addAssistant(
      response,
    );
  }

  ConversationSession
      get conversation =>
          session;

  String get lastContext {
    final turn =
        session.lastTurn;

    if (turn == null) {
      return "";
    }

    if (turn.topics.isEmpty) {
      return "";
    }

    return turn.topics.first;
  }

  String get lastMessage {
    final turn =
        session.lastTurn;

    if (turn == null) {
      return "";
    }

    return turn.userMessage;
  }

  String get workingContext =>
      workingMemory.build();
}
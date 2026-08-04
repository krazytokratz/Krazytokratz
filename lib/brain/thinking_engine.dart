import '../conversation/context_intelligence.dart';
import '../conversation/conversation_orchestrator.dart';

import 'decision_engine.dart';
import 'decision_result.dart';
import 'thinking_result.dart';

class ThinkingEngine {
  final ConversationOrchestrator orchestrator;

  final ContextIntelligence context;

  final DecisionEngine decision =
      DecisionEngine();

  ThinkingEngine({
    required this.orchestrator,
    required this.context,
  });

  Future<ThinkingResult> think(
    String message,
  ) async {
    // =====================================================
    // Bangun Context
    // =====================================================

    final memoryContext =
        await context.buildContext(
      message,
    );

    // =====================================================
    // Jalankan Handler Lokal
    // =====================================================

    final localResponse =
        await orchestrator.process(
      message,
    );

    // =====================================================
    // Simpan jawaban Assistant
    // =====================================================

    if (localResponse != null &&
        localResponse.trim().isNotEmpty) {
      context.registerResponse(
        localResponse,
      );
    }

    // =====================================================
    // Decision Engine
    // =====================================================

    final DecisionResult result =
        await decision.decide(
      localResponse:
          localResponse ?? "",
      memoryContext:
          memoryContext,
    );

    // =====================================================
    // Local Response
    // =====================================================

    if (result.useLocal) {
      return ThinkingResult(
        intent: "Local",
        memoryContext:
            result.context,
        response:
            result.response,
        useAI: false,
      );
    }

    // =====================================================
    // AI Response
    // =====================================================

    return ThinkingResult(
      intent: "AI",
      memoryContext:
          result.context,
      response: "",
      useAI: true,
    );
  }

  // =====================================================
  // Context Aktif
  // =====================================================

  String get lastContext =>
      context.lastContext;

  // =====================================================
  // Pesan Terakhir User
  // =====================================================

  String get lastMessage =>
      context.lastMessage;
}
import '../brain/thinking_engine.dart';

import '../memory/profile_manager.dart';
import '../memory/project_manager.dart';
import '../memory/memory_analyzer.dart';
import '../memory/memory_service.dart';
import '../memory/memory_repository.dart';
import '../memory/persistent_memory.dart';
import '../memory/memory_integration_engine.dart';

import 'context_intelligence.dart';
import 'conversation_orchestrator.dart';
import 'handler_router.dart';

import 'handlers/greeting_handler.dart';
import 'handlers/identity_handler.dart';
import 'handlers/memory_handler.dart';
import 'handlers/profile_handler.dart';
import 'handlers/project_handler.dart';

import 'intent_detector.dart';
import 'intent_handler.dart';
import 'response_generator.dart';
import 'response_style_builder.dart';

class ConversationEngine {
  final ProfileManager profileManager =
      ProfileManager();

  final ProjectManager projectManager =
      ProjectManager();

  final MemoryService memoryService =
      MemoryService();

  final PersistentMemory persistentMemory =
      PersistentMemory();

  late MemoryRepository memoryRepository;

  final MemoryIntegrationEngine
      memoryIntegrationEngine =
      MemoryIntegrationEngine();

  late MemoryAnalyzer analyzer;

  final IntentDetector intentDetector =
      IntentDetector();

  final IntentHandler intentHandler =
      IntentHandler();

  final ResponseGenerator
      responseGenerator =
      ResponseGenerator();

  final ResponseStyleBuilder
      responseStyleBuilder =
      ResponseStyleBuilder();

  late ContextIntelligence context;

  late ConversationOrchestrator
      orchestrator;

  late ThinkingEngine thinkingEngine;

  ConversationEngine() {
    memoryRepository =
        MemoryRepository(
      memoryService: memoryService,
      persistentMemory:
          persistentMemory,
    );
  }

  Future<void> initialize() async {
    await profileManager.load();

    await projectManager.load();

    await memoryIntegrationEngine.initialize();

    await memoryService.loadMemory();

    analyzer = MemoryAnalyzer(
      profileManager.profile,
    );

    context = ContextIntelligence();

    await context.initialize();

    orchestrator =
        ConversationOrchestrator(
      router: HandlerRouter(
        handlers: [
          GreetingHandler(
            profileManager:
                profileManager,
            projectManager:
                projectManager,
          ),
          IdentityHandler(),
          MemoryHandler(
            context: context,
          ),
          ProfileHandler(
            profileManager:
                profileManager,
          ),
          ProjectHandler(
            projectManager:
                projectManager,
          ),
        ],
      ),
    );

    thinkingEngine =
        ThinkingEngine(
      orchestrator: orchestrator,
      context: context,
    );
  }

  Future<String> respond(
    String message,
  ) async {
    final result =
        await thinkingEngine.think(
      message,
    );

    if (!result.useAI) {
      context.registerResponse(
        result.response,
      );

      return result.response;
    }

    return "";
  }

  void registerAssistantResponse(
    String response,
  ) {
    context.registerResponse(
      response,
    );
  }

  String get activeContext =>
      thinkingEngine.lastContext;

  String get lastMessage =>
      thinkingEngine.lastMessage;

  String get memoryContext =>
      context.workingContext;
}
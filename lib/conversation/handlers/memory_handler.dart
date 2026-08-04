import '../context_intelligence.dart';

class MemoryHandler {

  final ContextIntelligence context;

  MemoryHandler({

    required this.context,

  });

  Future<String?> handle(

    String message,

  ) async {

    final lower =

        message.toLowerCase();

    if (

      !_isMemoryQuestion(lower)

    ) {

      return null;

    }

    return await context.buildContext(

      message,

    );

  }

  bool _isMemoryQuestion(

    String text,

  ) {

    return

        text.contains("siapa saya") ||

        text.contains("ingat saya") ||

        text.contains("apa yang kamu tahu") ||

        text.contains("apa yang kamu ingat") ||

        text.contains("profil saya") ||

        text.contains("proyek saya");

  }

}
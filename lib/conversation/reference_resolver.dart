import 'conversation_session.dart';

class ReferenceResolver {
  final ConversationSession session;

  ReferenceResolver({
    required this.session,
  });

  // ==========================================================
  // Menentukan apakah pesan mengacu
  // ke percakapan sebelumnya
  // ==========================================================

  bool hasReference(
    String message,
  ) {
    final text =
        message.toLowerCase();

    return text.contains("itu") ||
        text.contains("tersebut") ||
        text.contains("tadi") ||
        text.contains("yang tadi") ||
        text.contains("lanjutkan") ||
        text.contains("bagaimana progresnya") ||
        text.contains("bagaimana hasilnya") ||
        text.contains("bagaimana kelanjutannya") ||
        text.contains("proyeknya") ||
        text.contains("nya?");
  }

  // ==========================================================
  // Mengambil referensi terakhir
  // ==========================================================

  String resolve(
    String message,
  ) {
    if (!hasReference(message)) {
      return "";
    }

    final turn =
        session.lastTurn;

    if (turn == null) {
      return "";
    }

    if (turn.topics.isNotEmpty) {
      return turn.topics.first;
    }

    if (turn.userMessage.isNotEmpty) {
      return turn.userMessage;
    }

    return "";
  }

  // ==========================================================
  // Menghasilkan context baru
  // ==========================================================

  String mergeContext(
    String message,
  ) {
    final reference =
        resolve(message);

    if (reference.isEmpty) {
      return message;
    }

    return """
Context:
$reference

User:
$message
""";
  }
}
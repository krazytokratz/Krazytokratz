import '../../core/kraz_identity.dart';
import '../../core/kraz_personality.dart';

class IdentityHandler {
  Future<String?> handle(
    String message,
  ) async {
    final lower = message.toLowerCase().trim();

    if (lower.contains("siapa kamu") ||
        lower.contains("siapa dirimu") ||
        lower.contains("kenalkan dirimu") ||
        lower.contains("ceritakan tentang dirimu")) {
      return _buildIdentity();
    }

    return null;
  }

  String _buildIdentity() {
    final buffer = StringBuffer();

    buffer.writeln(
      KrazIdentity.introduction(),
    );

    buffer.writeln();

    buffer.writeln(
      KrazPersonality.introduction(),
    );

    return buffer.toString().trim();
  }
}
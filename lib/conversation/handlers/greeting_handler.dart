import '../../memory/profile_manager.dart';
import '../../memory/project_manager.dart';

class GreetingHandler {
  final ProfileManager profileManager;
  final ProjectManager projectManager;

  GreetingHandler({
    required this.profileManager,
    required this.projectManager,
  });

  Future<String?> handle(
    String message,
  ) async {
    final lower = message.toLowerCase().trim();

    if (!_isGreeting(lower)) {
      return null;
    }

    final buffer = StringBuffer();

    buffer.writeln(
      _greetingByTime(),
    );

    if (profileManager.hasName) {
      buffer.writeln(
        "${profileManager.profile.name}.",
      );
    }

    buffer.writeln();
    buffer.writeln(
      "Senang bertemu kembali.",
    );

    if (projectManager.hasProject) {
      buffer.writeln();
      buffer.writeln(
        "Terakhir kita sedang mengerjakan:",
      );

      buffer.writeln(
        projectManager.summary(),
      );
    }

    buffer.writeln();
    buffer.writeln(
      "Apa yang ingin kita kerjakan hari ini?",
    );

    return buffer.toString();
  }

  bool _isGreeting(
    String text,
  ) {
    return text.contains("halo") ||
        text.contains("hai") ||
        text.contains("hi") ||
        text.contains("selamat pagi") ||
        text.contains("selamat siang") ||
        text.contains("selamat sore") ||
        text.contains("selamat malam");
  }

  String _greetingByTime() {
    final hour = DateTime.now().hour;

    if (hour < 11) {
      return "Selamat pagi";
    }

    if (hour < 15) {
      return "Selamat siang";
    }

    if (hour < 18) {
      return "Selamat sore";
    }

    return "Selamat malam";
  }
}
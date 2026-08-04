import '../../memory/project_manager.dart';

class ProjectHandler {
  final ProjectManager projectManager;

  ProjectHandler({
    required this.projectManager,
  });

  Future<String?> handle(
    String message,
  ) async {
    final lower = message.toLowerCase();

    if (!_isProjectQuestion(lower)) {
      return null;
    }

    if (!projectManager.hasProject) {
      return "Saya belum memiliki informasi mengenai proyek Anda.";
    }

    return projectManager.summary();
  }

  bool _isProjectQuestion(
    String text,
  ) {
    return text.contains("proyek saya") ||
        text.contains("project saya") ||
        text.contains("apa proyek saya") ||
        text.contains("ingat proyek saya") ||
        text.contains("apa yang sedang saya buat");
  }
}
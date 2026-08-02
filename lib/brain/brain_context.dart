import '../memory/profile_manager.dart';
import '../memory/project_manager.dart';

class BrainContext {
  final String message;

  final ProfileManager profileManager;

  final ProjectManager projectManager;

  final DateTime timestamp;

  const BrainContext({
    required this.message,
    required this.profileManager,
    required this.projectManager,
    required this.timestamp,
  });

  String get lowercaseMessage => message.toLowerCase();

  bool get hasUser =>
      profileManager.hasName;

  bool get hasProject =>
      projectManager.hasProject;
}
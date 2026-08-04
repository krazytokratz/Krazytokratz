import '../../memory/profile_manager.dart';

class ProfileHandler {
  final ProfileManager profileManager;

  ProfileHandler({
    required this.profileManager,
  });

  Future<String?> handle(
    String message,
  ) async {
    final lower = message.toLowerCase();

    if (!lower.contains("profil saya")) {
      return null;
    }

    return profileManager.profile.summary();
  }
}
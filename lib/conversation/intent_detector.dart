enum IntentType {
  greeting,
  identity,
 project,
  profile,
  remember,
  unknown,
}

class IntentDetector {
  IntentType detect(String input) {
    final text = input.toLowerCase();

    if (text.contains("halo") || text.contains("hai")) {
      return IntentType.greeting;
    }

    if (text.contains("siapa kamu")) {
      return IntentType.identity;
    }

    if (text.contains("proyek")) {
      return IntentType.project;
    }

    if (text.contains("profil")) {
      return IntentType.profile;
    }

    if (text.contains("ingat") ||
        text.contains("siapa saya")) {
      return IntentType.remember;
    }

    return IntentType.unknown;
  }
}
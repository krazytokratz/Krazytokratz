class UserProfile {
  final String name;
  final String communicationStyle;
  final List<String> interests;

  UserProfile({
    required this.name,
    required this.communicationStyle,
    required this.interests,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "communicationStyle": communicationStyle,
      "interests": interests,
    };
  }
}
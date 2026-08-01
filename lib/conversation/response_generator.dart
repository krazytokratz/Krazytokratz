class ResponseGenerator {
  String generate({
    required String? memoryResponse,
    required String defaultResponse,
  }) {
    if (memoryResponse != null &&
        memoryResponse.trim().isNotEmpty) {
      return memoryResponse;
    }

    return defaultResponse;
  }
}
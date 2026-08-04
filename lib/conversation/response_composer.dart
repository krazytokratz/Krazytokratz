class ResponseComposer {
  String compose({
    String? handlerResponse,
    String? aiResponse,
  }) {
    if (handlerResponse != null &&
        handlerResponse.trim().isNotEmpty) {
      return handlerResponse;
    }

    if (aiResponse != null &&
        aiResponse.trim().isNotEmpty) {
      return aiResponse;
    }

    return "Maaf, saya belum dapat memberikan jawaban.";
  }
}
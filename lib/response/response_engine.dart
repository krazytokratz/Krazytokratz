class ResponseEngine {
  const ResponseEngine();

  String build(
    String response,
  ) {
    return response.trim();
  }

  String emptyResponse() {
    return
        "Maaf, saya belum memiliki jawaban untuk itu.";
  }

  String errorResponse() {
    return
        "Maaf, terjadi kesalahan saat memproses permintaan Anda.";
  }
}
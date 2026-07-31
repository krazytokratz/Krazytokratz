enum MemoryPriority {
  low,
  medium,
  high,
  critical,
}


class MemoryPriorityConfig {

  /// Nilai bobot prioritas memori
  static const Map<MemoryPriority, int> score = {

    MemoryPriority.low: 1,

    MemoryPriority.medium: 5,

    MemoryPriority.high: 8,

    MemoryPriority.critical: 10,

  };


  /// Nama tampilan prioritas
  static String name(MemoryPriority priority) {

    switch (priority) {

      case MemoryPriority.low:
        return "Low";

      case MemoryPriority.medium:
        return "Medium";

      case MemoryPriority.high:
        return "High";

      case MemoryPriority.critical:
        return "Critical";

    }
  }


  /// Penjelasan fungsi prioritas
  static String description(MemoryPriority priority) {

    switch (priority) {

      case MemoryPriority.low:
        return
            "Informasi sementara yang tidak memiliki dampak besar.";

      case MemoryPriority.medium:
        return
            "Informasi yang berguna untuk konteks percakapan.";

      case MemoryPriority.high:
        return
            "Informasi penting yang membantu personalisasi Kraz.";

      case MemoryPriority.critical:
        return
            "Informasi utama yang harus dipertahankan dalam jangka panjang.";

    }
  }


  /// Mengecek apakah memori harus dipertahankan lama
  static bool isPermanent(MemoryPriority priority) {

    return priority == MemoryPriority.critical;

  }


  /// Mendapatkan nilai skor prioritas
  static int getScore(MemoryPriority priority) {

    return score[priority] ?? 0;

  }
}
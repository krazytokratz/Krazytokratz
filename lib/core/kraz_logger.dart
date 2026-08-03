class KrazLogger {

  static void info(String message) {

    // ignore: avoid_print
    print(
      "[KRAZ] $message",
    );

  }


  static void boot(String message) {

    // ignore: avoid_print
    print(
      "[BOOT] $message",
    );

  }


  static void error(String message) {

    // ignore: avoid_print
    print(
      "[ERROR] $message",
    );

  }

}
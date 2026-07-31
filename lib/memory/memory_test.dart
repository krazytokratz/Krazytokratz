import 'dart:developer' as developer;

import 'persistent_memory.dart';


class MemoryTest {


  final PersistentMemory memory;


  MemoryTest(
    this.memory,
  );



  void log(String message) {

    developer.log(
      message,
      name: "KRAZ_MEMORY_TEST",
    );

  }



  Future<void> run() async {


    log(
      "===== KRAZ MEMORY TEST =====",
    );



    // Simpan data
    await memory.save(
      "user_name",
      "Cen",
    );


    log(
      "Memory saved: user_name = Cen",
    );



    // Cek keberadaan memory
    final exists = await memory.exists(
      "user_name",
    );


    log(
      "Memory exists: $exists",
    );



    // Membaca memory
    final name = await memory.read(
      "user_name",
    );


    log(
      "Memory read: $name",
    );



    log(
      "===== TEST COMPLETE =====",
    );


  }


}
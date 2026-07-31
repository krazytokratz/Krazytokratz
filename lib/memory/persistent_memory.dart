import 'package:shared_preferences/shared_preferences.dart';

/// PersistentMemory
///
/// Layer penyimpanan permanen Kraz.
/// Bertugas menyimpan dan mengambil data memory
/// menggunakan SharedPreferences.
///
/// Architecture:
/// MemoryService
///      ↓
/// MemoryRepository
///      ↓
/// PersistentMemory
///      ↓
/// SharedPreferences (Device Storage)

class PersistentMemory {


  /// Menyimpan data memory
  ///
  /// Contoh:
  /// save("user_name", "Cen")
  ///
  Future<void> save(
    String key,
    String value,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      key,
      value,
    );

  }



  /// Membaca data memory
  ///
  /// Jika data tidak ditemukan
  /// maka mengembalikan null
  ///
  Future<String?> read(
    String key,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(
      key,
    );

  }



  /// Mengecek apakah memory tersedia
  ///
  /// Return:
  /// true  = data ada
  /// false = data tidak ada
  ///
  Future<bool> exists(
    String key,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(
      key,
    );

  }



  /// Menghapus satu memory tertentu
  ///
  /// Contoh:
  /// delete("user_name")
  ///
  Future<void> delete(
    String key,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(
      key,
    );

  }



  /// Menghapus seluruh memory
  ///
  /// Gunakan hati-hati
  ///
  Future<void> clear() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

  }



  /// Mengambil seluruh key memory
  ///
  /// Berguna untuk debugging
  ///
  Future<Set<String>> keys() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getKeys();

  }


}
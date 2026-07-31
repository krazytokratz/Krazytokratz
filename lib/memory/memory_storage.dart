class MemoryStorage {

  final Map<String, String> _memory = {};


  void save(
    String key,
    String value,
  ) {

    _memory[key] = value;

  }



  String? read(
    String key,
  ) {

    return _memory[key];

  }



  bool contains(
    String key,
  ) {

    return _memory.containsKey(key);

  }



  Map<String, String> getAll() {

    return Map.unmodifiable(
      _memory,
    );

  }



  void clear() {

    _memory.clear();

  }

}
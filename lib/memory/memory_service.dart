import 'memory_model.dart';

class MemoryService {

  final List<Memory> _memories = [];

  void save(Memory memory) {
    _memories.add(memory);
  }

  List<Memory> getAll() {
    return _memories;
  }
}
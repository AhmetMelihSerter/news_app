abstract class ISecureManager {
  Future<void> initialize();
  Future<void> createKey();
  Future<List<int>> readKey();
}

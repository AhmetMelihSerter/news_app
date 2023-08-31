abstract class IBugTracking {
  void createUser();
  void deleteUser();
  void captureException(Exception exception, StackTrace stackTrace);
}

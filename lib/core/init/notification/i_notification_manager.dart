abstract class INotificationManager {
  Future<void> initialize();
  Future<bool> isNotificationAccepted();
}

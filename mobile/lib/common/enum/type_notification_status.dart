enum TypeNotificationStatus { unread, warning, reminder, read }

extension TypeNotificationStatusExtension on TypeNotificationStatus {
  String get value {
    switch (this) {
      case TypeNotificationStatus.read:
        return "read";
      case TypeNotificationStatus.reminder:
        return "reminder";
      case TypeNotificationStatus.unread:
        return "unread";
      case TypeNotificationStatus.warning:
        return "warning";
    }
  }
}

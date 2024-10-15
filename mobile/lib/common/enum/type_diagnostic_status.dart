enum TypeDiagnosticStatus { unread, read, important }

extension TypeDiagnosticStatusExtension on TypeDiagnosticStatus {
  String get value {
    switch (this) {
      case TypeDiagnosticStatus.read:
        return "read";
      case TypeDiagnosticStatus.unread:
        return "unread";
      case TypeDiagnosticStatus.important:
        return "important";
    }
  }
}

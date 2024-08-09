String? transferTypeMedical(String data) {
  switch (data) {
    case "0":
      return "X-ray";
    case "CT Scan":
      return "CT scan";
    case "Ultrasound":
      return "Ultrasound";
    default:
      return "Unknown";
  }
}

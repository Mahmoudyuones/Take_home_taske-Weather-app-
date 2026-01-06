class ValidationConstants {
  ValidationConstants._();

  static const String emailPattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const int passwordMinLength = 8;
  static const int passwordMaxLength = 64;
}

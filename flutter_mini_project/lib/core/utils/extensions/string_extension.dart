extension StringExtension on String? {
  bool get isEmptyOrNull => this == null || this == '';
}

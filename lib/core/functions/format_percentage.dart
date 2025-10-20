String formatPercentage(String percentageString) {
  String cleanValue = percentageString.replaceAll('%', '');

  double value = double.tryParse(cleanValue) ?? 0;

  return "${value.toStringAsFixed(1)}%";
}

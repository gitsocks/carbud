class MileageEntry {
  final int id;
  final int distance;
  final int litres;
  final DateTime date;

  MileageEntry(
      {required this.id,
      required this.distance,
      required this.litres,
      required this.date});

  double calculateAverage() {
    double average = (distance / litres).toDouble();
    return double.parse(average.toStringAsFixed(2));
  }

  String formatDate() {
    final List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    int day = date.day;
    int month = date.month;
    int dayOfWeek = date.weekday;

    String formattedDate =
        '${day.toString().padLeft(2, '0')}${month.toString().padLeft(2, '0')}${days[dayOfWeek - 1]}';

    return formattedDate;
  }
}

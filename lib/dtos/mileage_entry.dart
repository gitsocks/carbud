class MileageEntry {
  final int id;
  final double distance;
  final double litres;
  final DateTime date;

  MileageEntry(
      {required this.id,
      required this.distance,
      required this.litres,
      required this.date});

  factory MileageEntry.fromJson(Map<String, dynamic> json) => MileageEntry(
        id: json['id'],
        distance: double.parse(json['distance'].toString()),
        litres: double.parse(json['litres'].toString()),
        date: DateTime.parse(json['date']),
      );

  double calculateAverage() {
    double average = (distance / litres).toDouble();
    return double.parse(average.toStringAsFixed(2));
  }

  String formatDate() {
    final List<String> days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

    int day = date.day;
    int month = date.month;
    int dayOfWeek = date.weekday;

    String formattedDate =
        '${day.toString().padLeft(2, '0')}${month.toString().padLeft(2, '0')}${days[dayOfWeek - 1]}';

    return formattedDate;
  }
}

class NewMileageEntry {
  final String vehicleId;
  final double distance;
  final double litres;
  final DateTime date;

  NewMileageEntry(this.vehicleId, this.date, this.distance, this.litres);

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'litres': litres,
    'vehicleId': vehicleId
  };
}
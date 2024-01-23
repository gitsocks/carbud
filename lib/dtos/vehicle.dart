class Vehicle {
  final int id;
  final String make;
  final String model;
  final int year;
  final String imageUrl;

  Vehicle(
      {required this.id,
      required this.make,
      required this.model,
      required this.year,
      required this.imageUrl});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'make': String make,
        'model': String model,
        'year': int year,
        'imageUrl': String imageUrl
      } =>
        Vehicle(
            id: id, make: make, model: model, year: year, imageUrl: imageUrl),
      _ => throw const FormatException('Failed to load vehicle.'),
    };
  }
}

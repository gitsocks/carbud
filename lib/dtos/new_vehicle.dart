import 'package:uuid/uuid.dart';

class NewVehicle {
  final String profileId;
  final String make;
  final String model;
  final int year;
  final int initialMileage;

  NewVehicle(this.make, this.model, this.year, this.initialMileage, this.profileId);

  Map<String, dynamic> toJson() => {
    'id': const Uuid().v1(),
    'make': make,
    'model': model,
    'year': year,
    'mileage': initialMileage,
    'profileId': profileId
  };
}
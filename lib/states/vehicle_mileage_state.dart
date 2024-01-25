import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/services/mileage_service.dart';
import 'package:flutter/material.dart';

class VehicleMileageState extends ChangeNotifier {
  late Future<List<MileageEntry>> futureMileageEntries;

  void init(int vehicleId) {
    futureMileageEntries = fetchVehicleMileageEntries(vehicleId);
    notifyListeners();
  }
}
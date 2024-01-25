
import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/services/vehicle_service.dart';
import 'package:flutter/material.dart';

class MyGarageState extends ChangeNotifier {
  late Future<List<Vehicle>> futureVehicles;

  void init() {
    futureVehicles = fetchVehicles();
    notifyListeners();
  }

  Future<Vehicle> addVehicle(NewVehicle vehicle) async {
    var newVehicle = createVehicle(vehicle);
    notifyListeners();
    return newVehicle;
  }
}
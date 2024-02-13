import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/main.dart';
import 'package:flutter/material.dart';

class GarageModel extends ChangeNotifier {
  late List<Vehicle> vehicles = [];

  GarageModel() {
    fetchVehicles();
  }

  Future<void> fetchVehicles() async {
    var userId = supabase.auth.currentUser?.id;

    if (userId != null) {
      var data = await supabase.from('Vehicle').select().eq('profileId', userId)
          as List<dynamic>;

      vehicles = data.map((e) => Vehicle.fromJson(e)).toList();

      notifyListeners();
    }
  }

  Future<void> addVehicle(NewVehicle newVehicle) async {
    var vehicle = newVehicle.toJson();
    await supabase.from('Vehicle').insert(vehicle);

    fetchVehicles();
  }
}

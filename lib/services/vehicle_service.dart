import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/main.dart';

Future<List<Vehicle>> fetchVehicles() async {
  final userId = supabase.auth.currentUser!.id;
  List<dynamic> vehicles = await supabase.from('Vehicle').select().eq('profileId', userId);
  return vehicles.map((e) => Vehicle.fromJson(e)).toList();
}

Future<void> createVehicle(NewVehicle newVehicle) async {
  await supabase.from('Vehicle').insert(newVehicle);
}

import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:carbud/main.dart';

Future<List<MileageEntry>> fetchVehicleMileageEntries(String vehicleId) async {
  List<MileageEntry> mileageEntries = [];

  var data = await supabase
      .from('Mileage')
      .select()
      .eq('vehicleId', vehicleId) as List<dynamic>;


  if (data.isNotEmpty) {
    mileageEntries = data.map((e) => MileageEntry.fromJson(e)).toList();
  }

  return mileageEntries;
}

Future<void> createNewMileageEntry(NewMileageEntry entry) async {
  await supabase.from('Mileage').insert(entry.toJson());
}

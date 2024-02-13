import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';

List<MileageEntry> vehicleMileageEntries = [
  MileageEntry(
      id: 1, distance: 456, litres: 30, date: DateTime.parse('2024-01-02')),
  MileageEntry(
      id: 2, distance: 389, litres: 27, date: DateTime.parse('2024-01-13')),
  MileageEntry(
      id: 3, distance: 500, litres: 40, date: DateTime.parse('2024-01-26')),
  MileageEntry(
      id: 4, distance: 250, litres: 18, date: DateTime.parse('2024-02-02')),
];

Future<List<MileageEntry>> fetchVehicleMileageEntries(String vehicleId) async {
  return vehicleMileageEntries;
}

Future<MileageEntry> createMileageEntry(NewMileageEntry entry) async {
  var entryId = vehicleMileageEntries.length + 1;
  var mileageEntry = MileageEntry(id: entryId, distance: entry.distance, litres: entry.litres, date: entry.date);
  vehicleMileageEntries.add(mileageEntry);

  return mileageEntry;
}

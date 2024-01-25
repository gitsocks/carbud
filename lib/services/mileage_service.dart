import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';

List<MileageEntry> vehicleMileageEntries = [
  MileageEntry(
      id: 1, distance: 456, litres: 30, date: DateTime.parse('2023-01-02')),
  MileageEntry(
      id: 2, distance: 389, litres: 27, date: DateTime.parse('2023-01-13')),
  MileageEntry(
      id: 3, distance: 500, litres: 40, date: DateTime.parse('2023-01-26')),
  MileageEntry(
      id: 4, distance: 250, litres: 18, date: DateTime.parse('2023-02-02')),
];

Future<List<MileageEntry>> fetchVehicleMileageEntries(int vehicleId) async {
  return vehicleMileageEntries;
}

Future<MileageEntry> createMileageEntry(NewMileageEntry entry) async {
  var entryId = vehicleMileageEntries.length + 1;
  var mileageEntry = MileageEntry(id: entryId, distance: entry.distance, litres: entry.litres, date: entry.date);
  vehicleMileageEntries.add(mileageEntry);

  return mileageEntry;
}

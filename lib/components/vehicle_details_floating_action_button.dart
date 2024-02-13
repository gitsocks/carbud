import 'package:carbud/components/add_car_sheet.dart';
import 'package:carbud/components/add_mileage_entry_sheet.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:flutter/material.dart';

class VehicleDetailsFloatingActionButton extends StatelessWidget {
  final String vehicleId;
  final Function(NewMileageEntry) onCreateMileageEntry;

  const VehicleDetailsFloatingActionButton(
      {super.key, required this.vehicleId, required this.onCreateMileageEntry});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => AddMileageEntrySheet(
                  vehicleId: vehicleId,
                  onCreateMileageEntry: onCreateMileageEntry,
                ));
      },
      tooltip: 'Add new car',
      child: const Icon(Icons.add),
    );
  }
}

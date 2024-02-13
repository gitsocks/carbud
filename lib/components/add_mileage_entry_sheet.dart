import 'package:carbud/components/decorated_text_field.dart';
import 'package:carbud/components/expanded_elevated_button.dart';
import 'package:carbud/components/new_mileage_entry_form.dart';
import 'package:carbud/components/new_vehicle_form.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:flutter/material.dart';

class AddMileageEntrySheet extends StatelessWidget {
  final String vehicleId;
  final Function(NewMileageEntry) onCreateMileageEntry;

  const AddMileageEntrySheet(
      {super.key, required this.vehicleId, required this.onCreateMileageEntry});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: const EdgeInsets.all(20.0)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      duration: const Duration(microseconds: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add Mileage Entry',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const Text('Add a new mileage entry'),
            NewMileageEntryForm(
              vehicleId: vehicleId,
              onCreateMileageEntry: onCreateMileageEntry,
            )
          ]),
    );
  }
}

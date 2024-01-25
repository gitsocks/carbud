import 'package:carbud/components/add_car_sheet.dart';
import 'package:carbud/components/add_mileage_entry_sheet.dart';
import 'package:flutter/material.dart';

class VehicleDetailsFloatingActionButton extends StatelessWidget {
  const VehicleDetailsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => const AddMileageEntrySheet());
      },
      tooltip: 'Add new car',
      child: const Icon(Icons.add),
    );
  }
}

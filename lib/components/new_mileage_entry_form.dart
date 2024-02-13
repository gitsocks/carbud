import 'dart:async';

import 'package:carbud/components/decorated_number_field.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:flutter/cupertino.dart';
import 'expanded_elevated_button.dart';

class NewMileageEntryForm extends StatefulWidget {
  final String vehicleId;
  final Function(NewMileageEntry) onCreateMileageEntry;

  const NewMileageEntryForm({super.key, required this.vehicleId, required this.onCreateMileageEntry});

  @override
  State<NewMileageEntryForm> createState() => _NewMileageEntryForm();
}

class _NewMileageEntryForm extends State<NewMileageEntryForm> {
  final distanceController = TextEditingController();
  final litresController = TextEditingController();

  @override
  void dispose() {
    distanceController.dispose();
    litresController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedNumberField(
            label: 'Distance (km)', hintText: '465', controller: distanceController),
        DecoratedNumberField(
            label: 'Litres (l)', hintText: '35', controller: litresController),
        ExpandedElevatedButton(onPressed: () {
            var mileageEntry = NewMileageEntry(widget.vehicleId, DateTime.now(), double.parse(distanceController.text), double.parse(litresController.text));
            widget.onCreateMileageEntry(mileageEntry);
        })
      ],
    );
  }
}

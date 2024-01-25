import 'package:carbud/components/decorated_number_field.dart';
import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/states/my_garage_state.dart';
import 'package:carbud/states/vehicle_mileage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'decorated_text_field.dart';
import 'expanded_elevated_button.dart';

class NewMileageEntryForm extends StatefulWidget {
  const NewMileageEntryForm({super.key});

  @override
  State<NewMileageEntryForm> createState() => _NewMileageEntryForm();
}

class _NewMileageEntryForm extends State<NewMileageEntryForm> {
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final initialMileageController = TextEditingController();

  @override
  void dispose() {
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    initialMileageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedNumberField(
            label: 'Distance (km)', hintText: '465', controller: makeController),
        DecoratedNumberField(
            label: 'Litres (l)', hintText: '35', controller: modelController),
        ExpandedElevatedButton(onPressed: () {
          print(makeController.text);
          print(modelController.text);
          print(DateTime.now());
        })
      ],
    );
  }
}

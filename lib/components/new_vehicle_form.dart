import 'package:carbud/components/decorated_number_field.dart';
import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/main.dart';
import 'package:carbud/states/garage_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'decorated_text_field.dart';
import 'expanded_elevated_button.dart';

class NewVehicleForm extends StatefulWidget {
  const NewVehicleForm({super.key});

  @override
  State<NewVehicleForm> createState() => _NewVehicleForm();
}

class _NewVehicleForm extends State<NewVehicleForm> {
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
    return Consumer<GarageModel>(
      builder: (context, garage, child) => Column(
        children: [
          DecoratedTextField(
              label: 'Make',
              hintText: 'e.g. Nissan',
              controller: makeController),
          DecoratedTextField(
              label: 'Model',
              hintText: 'e.g. Exa',
              controller: modelController),
          DecoratedNumberField(
              label: 'Year', hintText: 'e.g. 1986', controller: yearController),
          DecoratedNumberField(
              label: 'Initial Mileage',
              hintText: 'e.g. 170000',
              controller: initialMileageController),
          ExpandedElevatedButton(onPressed: () {
            var currentUser = supabase.auth.currentUser!;
            garage
                .addVehicle(NewVehicle(
              makeController.text,
              modelController.text,
              int.parse(yearController.text),
              int.parse(initialMileageController.text),
              currentUser.id,
            ))
                .then((newVehicle) {
              Navigator.pop(context);
            }).catchError((error) {
              print('Something went wrong.');
            });
          })
        ],
      ),
    );
  }
}

import 'package:carbud/components/add_car_sheet.dart';
import 'package:flutter/material.dart';

class MyGarageFloatingActionButton extends StatelessWidget {
  const MyGarageFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const AddCarSheet();
            });
      },
      tooltip: 'Add new car',
      child: const Icon(Icons.add),
    );
  }
}

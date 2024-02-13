import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/dtos/vehicle_details_screen_arguments.dart';
import 'package:carbud/screens/vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'image_card.dart';

class GarageVehicles extends StatelessWidget {
  final List<Vehicle> vehicles;

  const GarageVehicles({super.key, required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: vehicles.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Center(child: Text('You have no vehicles.'))],
                )
              : Column(
                  children: vehicles
                      .map(
                        (vehicle) => ImageCard(
                          constraints: constraints,
                          imageUrl: vehicle.imageUrl,
                          cardText: vehicle.model,
                          year: vehicle.year.toString(),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => VehicleScreen(vehicle: vehicle),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      );
    });
  }
}

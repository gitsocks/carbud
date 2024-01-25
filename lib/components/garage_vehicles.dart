import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/screens/vehicle_details_screen.dart';
import 'package:carbud/states/vehicle_mileage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          child: Column(
            children: vehicles
                .map((vehicle) => ImageCard(
                      constraints: constraints,
                      imageUrl: vehicle.imageUrl,
                      cardText: vehicle.model,
                      year: vehicle.year.toString(),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (BuildContext context) =>
                                VehicleMileageState(),
                            child: VehicleDetailsScreen(vehicle: vehicle),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      );
    });
  }
}

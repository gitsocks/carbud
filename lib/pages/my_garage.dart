import 'package:carbud/components/image_card.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/services/vehicle_service.dart';
import 'package:flutter/material.dart';

class MyGaragePage extends StatefulWidget {
  const MyGaragePage({super.key});

  @override
  State<MyGaragePage> createState() => _MyGaragePageState();
}

class _MyGaragePageState extends State<MyGaragePage> {
  var vehicles = fetchVehicles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('My Garage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: vehicles
              .map((vehicle) => ImageCard(
                    imageUrl: vehicle.imageUrl,
                    cardText: vehicle.model,
                    year: vehicle.year.toString(),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('Pressed'),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add)),
    );
  }
}

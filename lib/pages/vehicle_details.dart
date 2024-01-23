import 'package:carbud/components/vehicle_details_image.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleDetailsPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailsPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          floating: true,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                VehicleDetailsImage(
                    imageUrl: vehicle.imageUrl,
                    vehicleText: '${vehicle.make} ${vehicle.model}',
                    year: vehicle.year.toString(),
                    appBarHeight: constraints.maxHeight - 40),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mileage: 143000Kms'),
                      Text('Average: 14Km/L')
                    ],
                  ),
                )
              ],
            );
          }),
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                  title: Text('230${index}TUE'),
                  subtitle: const Text('456km / 35l'),
                  trailing: Text('14Km/L')),
              childCount: 20),
        )
      ],
    ));
  }
}

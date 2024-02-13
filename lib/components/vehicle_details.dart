import 'package:carbud/components/vehicle_details_image.dart';
import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  final Vehicle vehicle;
  final List<MileageEntry> mileageEntries;

  const VehicleDetails(
      {super.key, required this.vehicle, required this.mileageEntries});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          delegate: mileageEntries.isEmpty
              ? SliverChildBuilderDelegate(
                  (context, index) => const Text('No mileage entries'),
                  childCount: 1)
              : SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: Text(mileageEntries[index].formatDate()),
                    subtitle: Text(
                      '${mileageEntries[index].distance}km / ${mileageEntries[index].litres}l',
                    ),
                    trailing: Text(
                        '${mileageEntries[index].calculateAverage()} Km/L'),
                  ),
                  childCount: mileageEntries.length,
                ),
        )
      ],
    );
  }
}

import 'package:carbud/components/add_mileage_entry_sheet.dart';
import 'package:carbud/components/loading_state.dart';
import 'package:carbud/components/vehicle_details_floating_action_button.dart';
import 'package:carbud/components/vehicle_details_image.dart';
import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/services/mileage_service.dart';
import 'package:carbud/states/vehicle_mileage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var vehicleMileageState = context.watch<VehicleMileageState>();

    vehicleMileageState.init(widget.vehicle.id);

    return Scaffold(
      body: FutureBuilder(
        future: vehicleMileageState.futureMileageEntries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var mileageEntries = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  floating: true,
                  flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                    return Column(
                      children: [
                        VehicleDetailsImage(
                            imageUrl: widget.vehicle.imageUrl,
                            vehicleText:
                                '${widget.vehicle.make} ${widget.vehicle.model}',
                            year: widget.vehicle.year.toString(),
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
                          title: Text(mileageEntries[index].formatDate()),
                          subtitle: Text(
                              '${mileageEntries[index].distance}km / ${mileageEntries[index].litres}l'),
                          trailing: Text(
                              '${mileageEntries[index].calculateAverage()} Km/L')),
                      childCount: mileageEntries.length),
                )
              ],
            );
          }

          return const LoadingState();
        },
      ),
      floatingActionButton: const VehicleDetailsFloatingActionButton(),
    );
  }
}

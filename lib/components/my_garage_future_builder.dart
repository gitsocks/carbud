import 'package:carbud/components/garage_vehicles.dart';
import 'package:carbud/components/loading_state.dart';
import 'package:carbud/states/my_garage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyGarageFutureBuilder extends StatelessWidget {
  const MyGarageFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var garageState = context.watch<MyGarageState>();

    return FutureBuilder(
      future: garageState.futureVehicles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var vehicles = snapshot.data!;
          return GarageVehicles(vehicles: vehicles);
        } else {
          return const LoadingState();
        }
      },
    );
  }
}

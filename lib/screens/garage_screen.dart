import 'package:carbud/components/garage_vehicles.dart';
import 'package:carbud/components/loading_state.dart';
import 'package:carbud/components/my_garage_floating_action_button.dart';
import 'package:carbud/screens/account_screen.dart';
import 'package:carbud/states/garage_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Garage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const AccountScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Consumer<GarageModel>(
        builder: (context, garage, child) => garage.vehicles.isNotEmpty
            ? GarageVehicles(vehicles: garage.vehicles)
            : const LoadingState(),
      ),
      floatingActionButton: const MyGarageFloatingActionButton(),
    );
  }
}

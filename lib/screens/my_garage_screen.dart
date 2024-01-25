import 'package:carbud/components/my_garage_floating_action_button.dart';
import 'package:carbud/components/my_garage_future_builder.dart';
import 'package:carbud/states/my_garage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyGarageScreen extends StatefulWidget {
  const MyGarageScreen({super.key});

  @override
  State<MyGarageScreen> createState() => _MyGarageScreenState();
}

class _MyGarageScreenState extends State<MyGarageScreen> {
  @override
  Widget build(BuildContext context) {
    var garageState = context.watch<MyGarageState>();

    garageState.init();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Garage'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: const MyGarageFutureBuilder(),
      floatingActionButton: const MyGarageFloatingActionButton(),
    );
  }
}

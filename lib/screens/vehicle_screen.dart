import 'package:carbud/components/error_snack_bar.dart';
import 'package:carbud/components/loading_state.dart';
import 'package:carbud/components/vehicle_details.dart';
import 'package:carbud/components/vehicle_details_floating_action_button.dart';
import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/services/mileage_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class _VehicleScreenState extends State<VehicleScreen> {
  var _loading = true;

  List<MileageEntry> _mileageEntries = [];

  Future<void> _fetchMileageEntries() async {
    setState(() {
      _loading = true;
    });

    try {
      _mileageEntries = await fetchVehicleMileageEntries(widget.vehicle.id);
    } on PostgrestException catch (error) {
      ErrorSnackBar(message: error.message);
    } catch (error) {
      const ErrorSnackBar(message: 'Something went wrong.');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> createMileageEntry(NewMileageEntry entry) async {
    await createNewMileageEntry(entry);
    _fetchMileageEntries();
  }

  @override
  void initState() {
    super.initState();
    _fetchMileageEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const LoadingState()
          : VehicleDetails(
              vehicle: widget.vehicle,
              mileageEntries: _mileageEntries,
            ),
      floatingActionButton: _loading
          ? null
          : VehicleDetailsFloatingActionButton(
              vehicleId: widget.vehicle.id,
              onCreateMileageEntry: (entry) {
                createMileageEntry(entry);
                Navigator.pop(context);
              },
            ),
    );
  }
}

class VehicleScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleScreen({super.key, required this.vehicle});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

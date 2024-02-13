import 'package:carbud/components/error_snack_bar.dart';
import 'package:carbud/components/loading_state.dart';
import 'package:carbud/components/vehicle_details.dart';
import 'package:carbud/components/vehicle_details_floating_action_button.dart';
import 'package:carbud/dtos/mileage_entry.dart';
import 'package:carbud/dtos/new_mileage_entry.dart';
import 'package:carbud/dtos/vehicle.dart';
import 'package:carbud/main.dart';
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
      var data = await supabase.from('Mileage').select().eq('vehicleId', widget.vehicle.id) as List<dynamic>;

      if (data.isNotEmpty) {
        _mileageEntries = data.map((e) => MileageEntry.fromJson(e)).toList();
      }
    } on PostgrestException catch (error) {
      ErrorSnackBar(message: error.message) as SnackBar;
    } catch (error) {
      const ErrorSnackBar(message: 'Something went wrong.') as SnackBar;
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> createMileageEntry(NewMileageEntry entry) async {
    await supabase.from('Mileage').insert(entry.toJson());
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
          : VehicleDetails(vehicle: widget.vehicle, mileageEntries: _mileageEntries),
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

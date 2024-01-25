import 'package:carbud/dtos/new_vehicle.dart';
import 'package:carbud/dtos/vehicle.dart';

List<Vehicle> vehicles = [
  Vehicle(
      id: 1,
      make: 'Nissan',
      model: 'Exa',
      year: 1986,
      mileage: 172000,
      imageUrl:
          'https://images.drive.com.au/driveau/image/upload/c_fill,f_auto,g_auto,h_1080,q_auto:eco,w_1920/v1/cms/uploads/lerjwhwggfotpuw8lx1n'),
  Vehicle(
      id: 2,
      make: 'Suzuki',
      model: 'Swift',
      year: 2024,
      mileage: 35,
      imageUrl:
          'https://bbhatfieldsuzuki.co.za/wp-content/uploads/2021/09/NS-G-01.jpg')
];

Future<List<Vehicle>> fetchVehicles() async {
  await Future.delayed(const Duration(seconds: 2));
  return vehicles;
}

Future<Vehicle> createVehicle(NewVehicle newVehicle) async {
  var newId = vehicles.length + 1;
  var vehicle = Vehicle(
    id: newId,
    make: newVehicle.make,
    model: newVehicle.model,
    year: newVehicle.year,
    mileage: newVehicle.initialMileage,
  );

  vehicles.add(vehicle);

  return vehicle;
}

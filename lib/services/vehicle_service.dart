import 'package:carbud/dtos/vehicle.dart';

List<Vehicle> fetchVehicles() {
  return [
    Vehicle(
        id: 1,
        make: 'Nissan',
        model: 'Exa',
        year: 1986,
        imageUrl:
            'https://images.drive.com.au/driveau/image/upload/c_fill,f_auto,g_auto,h_1080,q_auto:eco,w_1920/v1/cms/uploads/lerjwhwggfotpuw8lx1n'),
    Vehicle(
        id: 2,
        make: 'Suzuki',
        model: 'Swift',
        year: 2024,
        imageUrl:
            'https://bbhatfieldsuzuki.co.za/wp-content/uploads/2021/09/NS-G-01.jpg')
  ];
}

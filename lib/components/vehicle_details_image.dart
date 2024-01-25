import 'package:flutter/material.dart';

class VehicleDetailsImage extends StatelessWidget {
  final String? imageUrl;
  final String vehicleText;
  final String year;
  final double appBarHeight;

  const VehicleDetailsImage({Key? key,
    this.imageUrl,
    required this.vehicleText,
    required this.year,
    required this.appBarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> vehicleImage;

    if (imageUrl == null) {
      vehicleImage = const AssetImage('assets/placeholder-car.jpg');
    } else {
      vehicleImage = NetworkImage(imageUrl!);
    }

    return Stack(
      children: [
        // Vehicle Image
        Container(
          height: appBarHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: vehicleImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: appBarHeight,
          decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.5) // Adjust the color and opacity as needed
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 224, 224, 224),
                ),
              ),
              Text(
                vehicleText,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


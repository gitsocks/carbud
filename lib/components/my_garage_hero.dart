import 'package:flutter/material.dart';

class MyGarageHero extends StatelessWidget {
  final double heroHeight;

  const MyGarageHero({super.key, required this.heroHeight});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height: heroHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/garage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: heroHeight,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
        const Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 224, 224, 224),
                ),
              ),
              Text(
                'Your Garage',
                style: TextStyle(
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

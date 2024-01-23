import 'package:carbud/pages/my_garage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarbudApp());
}

class CarbudApp extends StatelessWidget {
  const CarbudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbud',
      routes: {'/vehicle': (context) => Placeholder()},
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyGaragePage(),
    );
  }
}

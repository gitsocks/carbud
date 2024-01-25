import 'package:carbud/screens/my_garage_screen.dart';
import 'package:carbud/states/my_garage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CarbudApp());
}

class CarbudApp extends StatelessWidget {
  const CarbudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyGarageState(),
      child: MaterialApp(
        title: 'Carbud',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: const MyGarageScreen(),
      ),
    );
  }
}

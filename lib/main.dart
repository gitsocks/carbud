import 'package:carbud/dtos/vehicle_details_screen_arguments.dart';
import 'package:carbud/screens/login_screen.dart';
import 'package:carbud/screens/garage_screen.dart';
import 'package:carbud/screens/splash_screen.dart';
import 'package:carbud/screens/vehicle_screen.dart';
import 'package:carbud/states/garage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => GarageModel(),
      child: const CarbudApp(),
    ),
  );
}

final supabase = Supabase.instance.client;

class CarbudApp extends StatelessWidget {
  const CarbudApp({super.key});

  final String title = 'CarBud';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/garage': (_) => const GarageScreen(),
      },
    );
  }
}

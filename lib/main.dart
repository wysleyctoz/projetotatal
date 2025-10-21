import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HotelApp.dart';
import 'controllers/favoritos_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritosController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HotelApp();
  }
}

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flight_takeoff,      // Ícone de avião
            size: 72,                  // Tamanho do ícone
            color: Colors.green,  // Cor do ícone
          ),
          const SizedBox(height: 12),
          const Text(
            'Bem-vindo ao Partiu Rolê',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Toque em Hotéis para ver lista e clima por cidade.'),
        ],
      ),
    );
  }
}

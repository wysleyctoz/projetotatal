import 'package:flutter/material.dart';
import 'hotel_screen.dart';
import 'favoritos.dart';
import 'screens/weather_screen.dart';

class HotelApp extends StatefulWidget {
  const HotelApp({super.key});

  @override
  State<HotelApp> createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WeatherScreen(),
    const AgendamentosScreen(),
    const HotelScreen(),
    const FavoritosScreen(),
    const PerfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'nome do app';
      case 1:
        return 'Agendamentos';
      case 2:
        return 'Hotéis';
      case 3:
        return 'Favoritos';
      case 4:
        return 'Perfil';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HotelApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800],
          elevation: 3,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_getTitleForIndex(_selectedIndex)),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  /// Rodapé de navegação (mantendo o design original verde)
  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.green[800],
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Agendamentos'),
        BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Hotéis'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green[200],
      unselectedItemColor: Colors.green[400],
      onTap: _onItemTapped,
    );
  }
}

class AgendamentosScreen extends StatelessWidget {
  const AgendamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.calendar_today, color: Colors.green[700], size: 100),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.person, color: Colors.green[700], size: 100),
    );
  }
}

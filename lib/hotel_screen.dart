import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/propriedade.dart';
import 'api/propriedades_api.dart';
import 'api/weather_api.dart';
import 'controllers/favoritos_controller.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final PropriedadesApi propriedadesApi = PropriedadesApi();
  final WeatherApi weatherApi = WeatherApi();

  late Future<List<Propriedade>> propriedadesFuture;

  @override
  void initState() {
    super.initState();
    propriedadesFuture = propriedadesApi.findAll();
  }

  Future<Map<String, dynamic>?> _getClima(double lat, double lon) async {
    try {
      return await weatherApi.getWeather(lat, lon);
    } catch (e) {
      debugPrint('Erro clima: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritosCtrl = Provider.of<FavoritosController>(context);

    return Scaffold(
      body: FutureBuilder<List<Propriedade>>(
        future: propriedadesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma propriedade encontrada'));
          }

          final lista = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final p = lista[index];
              final ehFavorito = favoritosCtrl.isFavorito(p);

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: p.imageUrl.isNotEmpty
                        ? Image.network(
                      p.imageUrl,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image),
                    )
                        : const Icon(Icons.image),
                  ),
                  title: Text(p.nome),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cidade: ${p.cidade}'),
                      Text('Preço: R\$ ${p.preco.toStringAsFixed(2)}'),
                      const SizedBox(height: 6),
                      FutureBuilder<Map<String, dynamic>?>(
                        future: _getClima(p.latitude, p.longitude),
                        builder: (context, climaSnapshot) {
                          if (climaSnapshot.connectionState == ConnectionState.waiting) {
                            return const SizedBox(
                              height: 8,
                              width: 120,
                              child: LinearProgressIndicator(),
                            );
                          } else if (climaSnapshot.hasError) {
                            return const Text('Erro ao buscar clima');
                          } else if (!climaSnapshot.hasData || climaSnapshot.data == null) {
                            return const Text('Clima indisponível');
                          } else {
                            final clima = climaSnapshot.data!;
                            final temp = clima['temperature'] ?? '—';
                            final wind = clima['windspeed'] ?? '—';
                            return Text('Temp: $temp°C • Vento: $wind m/s');
                          }
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      ehFavorito ? Icons.favorite : Icons.favorite_border,
                      color: ehFavorito ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => favoritosCtrl.toggleFavorito(p),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import '../domain/propriedade.dart';
import 'package:flutter/foundation.dart';

class PropriedadesApi {
  final Dio dio = Dio();

  Future<List<Propriedade>> findAll() async {
    try {
      // Tente buscar de uma API real se tiver
      final response = await dio.get('https://raw.githubusercontent.com/tarsisms/fake-api/main/properties.json');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => Propriedade.fromJson(Map<String, dynamic>.from(e))).toList();
        }
      }
    } catch (e) {
      debugPrint('Erro ao buscar propriedades: $e');
    }

    // Mock local: 12 hotéis com imagens
    return [
      Propriedade(
        id: 1,
        nome: 'Pousada das Palmeiras',
        preco: 120.0,
        imageUrl: 'https://images.unsplash.com/photo-1560343090-f0409e92791a?auto=format&fit=crop&w=800&q=60',
        cidade: 'Maceió',
        latitude: -9.66599,
        longitude: -35.735,
      ),
      Propriedade(
        id: 2,
        nome: 'Hotel Marazul',
        preco: 220.0,
        imageUrl: 'https://images.unsplash.com/photo-1582719478175-8f5e8a71e0b7?auto=format&fit=crop&w=800&q=60',
        cidade: 'Recife',
        latitude: -8.04756,
        longitude: -34.877,
      ),
      Propriedade(
        id: 3,
        nome: 'Hotel Atlântico',
        preco: 350.0,
        imageUrl: 'https://images.unsplash.com/photo-1501117716987-c8e1ec13fdfb?auto=format&fit=crop&w=800&q=60',
        cidade: 'Rio de Janeiro',
        latitude: -22.9068,
        longitude: -43.1729,
      ),
      Propriedade(
        id: 4,
        nome: 'Pousada das Ondas',
        preco: 180.0,
        imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=800&q=60',
        cidade: 'Salvador',
        latitude: -12.9777,
        longitude: -38.5016,
      ),
      Propriedade(
        id: 5,
        nome: 'Hotel Paraíso',
        preco: 400.0,
        imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=60',
        cidade: 'São Paulo',
        latitude: -23.5505,
        longitude: -46.6333,
      ),
      Propriedade(
        id: 6,
        nome: 'Pousada Encanto',
        preco: 200.0,
        imageUrl: 'https://images.unsplash.com/photo-1608889174045-5d2e7b7b04ee?auto=format&fit=crop&w=800&q=60',
        cidade: 'Fortaleza',
        latitude: -3.71722,
        longitude: -38.5433,
      ),
      Propriedade(
        id: 7,
        nome: 'Hotel das Flores',
        preco: 250.0,
        imageUrl: 'https://images.unsplash.com/photo-1576675788086-2d1073be67a5?auto=format&fit=crop&w=800&q=60',
        cidade: 'Florianópolis',
        latitude: -27.5954,
        longitude: -48.5480,
      ),
      Propriedade(
        id: 8,
        nome: 'Pousada Sol e Mar',
        preco: 170.0,
        imageUrl: 'https://images.unsplash.com/photo-1542317854-8c5b05a238aa?auto=format&fit=crop&w=800&q=60',
        cidade: 'Natal',
        latitude: -5.7945,
        longitude: -35.2110,
      ),
      Propriedade(
        id: 9,
        nome: 'Hotel Vista Mar',
        preco: 300.0,
        imageUrl: 'https://images.unsplash.com/photo-1568495248636-6439b3566d6e?auto=format&fit=crop&w=800&q=60',
        cidade: 'Recife',
        latitude: -8.04756,
        longitude: -34.877,
      ),
      Propriedade(
        id: 10,
        nome: 'Pousada do Farol',
        preco: 220.0,
        imageUrl: 'https://images.unsplash.com/photo-1501117716987-c8e1ec13fdfb?auto=format&fit=crop&w=800&q=60',
        cidade: 'Maceió',
        latitude: -9.66599,
        longitude: -35.735,
      ),
      Propriedade(
        id: 11,
        nome: 'Hotel Horizonte',
        preco: 380.0,
        imageUrl: 'https://images.unsplash.com/photo-1542317854-8c5b05a238aa?auto=format&fit=crop&w=800&q=60',
        cidade: 'Rio de Janeiro',
        latitude: -22.9068,
        longitude: -43.1729,
      ),
      Propriedade(
        id: 12,
        nome: 'Pousada das Estrelas',
        preco: 210.0,
        imageUrl: 'https://images.unsplash.com/photo-1608889174045-5d2e7b7b04ee?auto=format&fit=crop&w=800&q=60',
        cidade: 'Fortaleza',
        latitude: -3.71722,
        longitude: -38.5433,
      ),
    ];
  }
}

import 'package:dio/dio.dart';
import '../domain/propriedade.dart';
import 'package:flutter/foundation.dart';

class PropriedadesApi {
  final Dio dio = Dio();

  Future<List<Propriedade>> findAll() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/tarsisms/fake-api/main/properties.json'
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => Propriedade.fromJson(Map<String, dynamic>.from(e))).toList();
        }
      }
    } catch (e) {
      debugPrint('Erro ao buscar propriedades: $e');
    }

    return [
      Propriedade(
        id: 1,
        nome: 'Pousada das Palmeiras',
        preco: 120.0,
        imageUrl: 'https://i0.wp.com/viajandonajanela.com/wp-content/uploads/2020/09/melhores-hoteis-booking-capa.jpg?fit=1900%2C1069&ssl=1',
        cidade: 'Maceió',
        latitude: -9.66599,
        longitude: -35.735,
      ),
      Propriedade(
        id: 2,
        nome: 'Hotel Marazul',
        preco: 220.0,
        imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2f/de/67/27/lobby-do-hotel.jpg?w=900&h=500&s=1',
        cidade: 'Recife',
        latitude: -8.04756,
        longitude: -34.877,
      ),
      Propriedade(
        id: 3,
        nome: 'Hotel Atlântico',
        preco: 350.0,
        imageUrl: 'https://viagemegastronomia.cnnbrasil.com.br/wp-content/uploads/sites/5/2022/10/BA_RA-HOTEL-4.jpg?w=1024',
        cidade: 'Rio de Janeiro',
        latitude: -22.9068,
        longitude: -43.1729,
      ),
      Propriedade(
        id: 4,
        nome: 'Pousada das Ondas',
        preco: 180.0,
        imageUrl: 'https://www.dicasdeviagem.com/wp-content/uploads/2021/06/hotel-fasano-boa-vista-quarto.jpg',
        cidade: 'Salvador',
        latitude: -12.9777,
        longitude: -38.5016,
      ),
      Propriedade(
        id: 5,
        nome: 'Hotel Paraíso',
        preco: 400.0,
        imageUrl: 'https://images.homify.com/v1498652526/p/photo/image/2091058/_76A2007-1.jpg',
        cidade: 'São Paulo',
        latitude: -23.5505,
        longitude: -46.6333,
      ),
      Propriedade(
        id: 6,
        nome: 'Pousada Encanto',
        preco: 200.0,
        imageUrl: 'https://www.viagenscinematograficas.com.br/wp-content/uploads/2021/03/Porto-de-Galinhas-Resorts-Pousadas-Capa-3.jpg',
        cidade: 'Fortaleza',
        latitude: -3.71722,
        longitude: -38.5433,
      ),
      Propriedade(
        id: 7,
        nome: 'Hotel das Flores',
        preco: 250.0,
        imageUrl: 'https://www.rioquente.com.br/images/hotels/0005/card_1.jpg',
        cidade: 'Florianópolis',
        latitude: -27.5954,
        longitude: -48.5480,
      ),
      Propriedade(
        id: 8,
        nome: 'Pousada Sol e Mar',
        preco: 170.0,
        imageUrl: 'https://sdesignparatyhotel.com.br/wp-content/uploads/2025/08/estrela_da_manha-43-scaled.jpg',
        cidade: 'Natal',
        latitude: -5.7945,
        longitude: -35.2110,
      ),
      Propriedade(
        id: 9,
        nome: 'Hotel Vista Mar',
        preco: 300.0,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi77cCZa-vsfWFcXJ7g61Pfw2Z91Vqmb6k6w&s',
        cidade: 'Recife',
        latitude: -8.04756,
        longitude: -34.877,
      ),
      Propriedade(
        id: 10,
        nome: 'Pousada do Farol',
        preco: 220.0,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRN2ch6_i8cQz9ajKTqZqXyrD8CwcfFnsXjQ&s',
        cidade: 'Maceió',
        latitude: -9.66599,
        longitude: -35.735,
      ),
      Propriedade(
        id: 11,
        nome: 'Hotel Horizonte',
        preco: 380.0,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAFSJ1BUyKuMrxpmaXtVdAZef_71RnVsVjeg&s',
        cidade: 'Rio de Janeiro',
        latitude: -22.9068,
        longitude: -43.1729,
      ),
      Propriedade(
        id: 12,
        nome: 'Pousada das Estrelas',
        preco: 210.0,
        imageUrl: 'https://images.squarespace-cdn.com/content/v1/67ed669403cdd76f648d5d17/a2edd8dc-76ea-4c30-bde5-c69d99f11ed9/_CAC2882+Hotel+Hardmand+%C2%A9+Cacio+Murilo+trok-2.jpg',
        cidade: 'Fortaleza',
        latitude: -3.71722,
        longitude: -38.5433,
      ),
    ];
  }
}

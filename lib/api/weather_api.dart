import 'package:dio/dio.dart';

class WeatherApi {
  final Dio dio = Dio();

  // Retorna mapa simples com temperatura atual (usa open-meteo)
  Future<Map<String, dynamic>> getWeather(double lat, double lon) async {
    final response = await dio.get('https://api.open-meteo.com/v1/forecast', queryParameters: {
      'latitude': lat,
      'longitude': lon,
      'current_weather': true,
      'timezone': 'auto',
    });

    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null && data['current_weather'] != null) {
        return Map<String, dynamic>.from(data['current_weather']);
      } else {
        throw Exception('Dados de clima ausentes');
      }
    } else {
      throw Exception('Erro ao buscar clima: ${response.statusCode}');
    }
  }
}

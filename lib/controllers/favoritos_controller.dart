import 'package:flutter/material.dart';
import '../domain/propriedade.dart';

class FavoritosController extends ChangeNotifier {
  final List<Propriedade> _favoritos = [];

  List<Propriedade> get favoritos => List.unmodifiable(_favoritos);

  bool isFavorito(Propriedade p) {
    return _favoritos.any((f) => f.id == p.id);
  }

  void toggleFavorito(Propriedade p) {
    final jaExiste = isFavorito(p);
    if (jaExiste) {
      _favoritos.removeWhere((f) => f.id == p.id);
    } else {
      _favoritos.add(p);
    }
    notifyListeners();
  }

  void remover(Propriedade p) {
    _favoritos.removeWhere((f) => f.id == p.id);
    notifyListeners();
  }
}

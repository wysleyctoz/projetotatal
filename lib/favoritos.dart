import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/favoritos_controller.dart';
import 'domain/propriedade.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosCtrl = Provider.of<FavoritosController>(context);
    final favoritos = favoritosCtrl.favoritos;

    return Scaffold(
      body: favoritos.isEmpty
          ? const Center(child: Text('Nenhum hotel favoritado ainda.'))
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          final Propriedade p = favoritos[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: p.imageUrl.isNotEmpty
                  ? Image.network(p.imageUrl, width: 80, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.image))
                  : const Icon(Icons.image),
              title: Text(p.nome),
              subtitle: Text('Cidade: ${p.cidade}\nPreço: R\$ ${p.preco.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.green),
                onPressed: () => favoritosCtrl.remover(p),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Propriedade {
  final int id;
  final String nome;
  final double preco;
  final String imageUrl;
  final String cidade;
  final double latitude;
  final double longitude;

  Propriedade({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imageUrl,
    required this.cidade,
    required this.latitude,
    required this.longitude,
  });

  factory Propriedade.fromJson(Map<String, dynamic> json) {
    return Propriedade(
      id: (json['id'] ?? 0) as int,
      nome: (json['nome'] ?? '') as String,
      preco: ((json['preco'] ?? 0) as num).toDouble(),
      imageUrl: (json['imageUrl'] ?? json['imagem'] ?? '') as String,
      cidade: (json['cidade'] ?? json['localidade'] ?? '') as String,
      latitude: ((json['latitude'] ?? 0) as num).toDouble(),
      longitude: ((json['longitude'] ?? 0) as num).toDouble(),
    );
  }
}

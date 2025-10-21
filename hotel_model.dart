class HotelCardData {
  final String nome;
  final String preco;
  final String imagem;

  HotelCardData({
    required this.nome,
    required this.preco,
    required this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'preco': preco,
      'imagem': imagem,
    };
  }

  factory HotelCardData.fromMap(Map<String, dynamic> map) {
    return HotelCardData(
      nome: map['nome'],
      preco: map['preco'],
      imagem: map['imagem'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HotelCardData &&
              runtimeType == other.runtimeType &&
              nome == other.nome;

  @override
  int get hashCode => nome.hashCode;
}

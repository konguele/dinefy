class Currency {
  final String code;
  final String symbol;

  Currency({required this.code, required this.symbol});

  // Sobrescribir el operador ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Currency &&
        other.code == code &&
        other.symbol == symbol;
  }

  // Sobrescribir hashCode
  @override
  int get hashCode => code.hashCode ^ symbol.hashCode;
}
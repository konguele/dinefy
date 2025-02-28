class Transaction {
  final String category;
  final double amount;
  final DateTime date; // Añadir campo de fecha

  Transaction({
    required this.category,
    required this.amount,
    required this.date, // Añadir campo de fecha
  });
}
import 'package:flutter/material.dart';
import '../models/transaction.dart'; // Importar el modelo de transacción
import '../localization/app_localizations.dart'; // Importar AppLocalizations

class BalanceButtons extends StatelessWidget {
  final double balance;
  final VoidCallback onAddIncome;
  final VoidCallback onAddExpense;
  final List<Transaction> transactions; // Lista de transacciones

  BalanceButtons({
    required this.balance,
    required this.onAddIncome,
    required this.onAddExpense,
    required this.transactions,
  });

  // Función para mostrar el diálogo de transacciones
  void _showTransactionsDialog(BuildContext context) {
    String searchQuery = ''; // Variable para almacenar la búsqueda

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Depuración: Verificar si la lista de transacciones es null o está vacía
            print('Número de transacciones: ${transactions.length}');
            if (transactions.isEmpty) {
              print('La lista de transacciones está vacía');
            }

            // Filtrar transacciones por categoría
            List<Transaction> filteredTransactions = searchQuery.isEmpty
                ? transactions
                : transactions
                    .where((transaction) => transaction.category
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                    .toList();

            return AlertDialog(
              title: Text(AppLocalizations.of(context).transactionsTitle), // Usar traducción
              content: Container(
                width: MediaQuery.of(context).size.width * 0.9, // Ancho del diálogo
                height: MediaQuery.of(context).size.height * 0.6, // Altura del diálogo
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Campo de búsqueda
                    TextField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).searchCategory, // Usar traducción
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value; // Actualizar la búsqueda
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    // Lista de transacciones filtradas
                    Expanded(
                      child: filteredTransactions.isEmpty
                          ? Center(
                              child: Text(AppLocalizations.of(context).noData), // Usar traducción
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredTransactions.length,
                              itemBuilder: (context, index) {
                                final transaction = filteredTransactions[index];
                                return ListTile(
                                  leading: Icon(
                                    transaction.amount > 0
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    color: transaction.amount > 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  title: Text(transaction.category),
                                  subtitle: Text(
                                    '${transaction.amount.toStringAsFixed(2)} €',
                                    style: TextStyle(
                                      color: transaction.amount > 0
                                          ? Colors.green
                                          : Colors.red, // Color del monto
                                    ),
                                  ),
                                  trailing: Text(
                                    '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context).close), // Usar traducción
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: onAddExpense,
          backgroundColor: Color(0xFFF72585),
          child: Icon(Icons.remove),
        ),
        // Botón de balance modificado
        Container(
          width: 150,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF3A0CA3),
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
          ),
          child: TextButton(
            onPressed: () => _showTransactionsDialog(context), // Mostrar diálogo de transacciones
            child: Center(
              child: Text(
                '${AppLocalizations.of(context).balance}: ${balance.toStringAsFixed(2)}€', // Usar traducción
                style: TextStyle(
                  color: balance >= 0 ? Colors.green : Colors.red,
                  fontSize: 14, // Tamaño de fuente más pequeño
                ),
                textAlign: TextAlign.center, // Centrar el texto
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: onAddIncome,
          backgroundColor: Color(0xFF4CC9F0),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
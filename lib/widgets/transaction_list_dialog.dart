import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionListDialog extends StatelessWidget {
  final List<Transaction> dailyTransactions;

  TransactionListDialog({required this.dailyTransactions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Transacciones del día'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: dailyTransactions.map((tx) {
          return ListTile(
            title: Text(tx.category),
            trailing: Text(
              '${tx.amount.toStringAsFixed(2)} €',
              style: TextStyle(
                color: tx.amount >= 0 ? Colors.green : Colors.red,
              ),
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class TransactionDialog extends StatefulWidget {
  final Function(String title, double amount, String category, DateTime date) onSave;

  const TransactionDialog(this.onSave);

  @override
  _TransactionDialogState createState() => _TransactionDialogState();
}

class _TransactionDialogState extends State<TransactionDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String selectedCategory = 'Comida';
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _saveTransaction() {
    final String title = titleController.text;
    final double? amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount == null || amount <= 0) {
      _showError();
      return;
    }

    widget.onSave(title, amount, selectedCategory, selectedDate);
    Navigator.of(context).pop();
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor, introduce un título y un importe válidos.'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Añadir Transacción'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Importe (€)'),
          ),
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: <String>[
              'Salario',
              'Comida',
              'Médico',
              'Gimnasio',
              'Viajes',
              'Educación',
              'Transporte',
              'Alquiler',
              'Hipoteca',
              'Luz',
              'Agua',
              'Gas',
              'Entretenimiento',
              'Tecnología',
              'Ahorro'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Fecha: '),
              TextButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Text("${selectedDate.toLocal()}".split(' ')[0]),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: _saveTransaction,
          child: Text('Guardar'),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../models/currency.dart';

class CurrencyPicker extends StatelessWidget {
  final List<Currency> currencies;
  final Currency selectedCurrency;
  final Function(Currency) onCurrencySelected;

  const CurrencyPicker({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Currency>(
      value: selectedCurrency,
      onChanged: (Currency? newValue) {
        if (newValue != null) {
          onCurrencySelected(newValue);
        }
      },
      items: currencies.map<DropdownMenuItem<Currency>>((Currency currency) {
        return DropdownMenuItem<Currency>(
          value: currency,
          child: Text('${currency.symbol} - ${currency.code}'),
        );
      }).toList(),
    );
  }
}
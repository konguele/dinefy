import 'package:flutter/material.dart';
import 'currency_picker.dart';
import '../models/currency.dart';

class SettingsDrawer extends StatelessWidget {
  final List<Currency> currencies;
  final Currency selectedCurrency;
  final Function(Currency) onCurrencyChanged;
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SettingsDrawer({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Change Currency'),
            trailing: SizedBox(
              width: 150, // Limitar el ancho del CurrencyPicker
              child: CurrencyPicker(
                currencies: currencies,
                selectedCurrency: selectedCurrency,
                onCurrencySelected: onCurrencyChanged,
              ),
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: onThemeChanged,
            ),
          ),
        ],
      ),
    );
  }
}
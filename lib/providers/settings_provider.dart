import 'package:flutter/material.dart';
import '../models/currency.dart';

class SettingsProvider with ChangeNotifier {
  Currency _selectedCurrency;
  bool _isDarkMode;

  SettingsProvider({required Currency selectedCurrency, required bool isDarkMode})
      : _selectedCurrency = selectedCurrency,
        _isDarkMode = isDarkMode;

  Currency get selectedCurrency => _selectedCurrency;
  bool get isDarkMode => _isDarkMode;

  void setCurrency(Currency newCurrency) {
    _selectedCurrency = newCurrency;
    notifyListeners();
  }

  void toggleTheme(bool newValue) {
    _isDarkMode = newValue;
    notifyListeners();
  }
}
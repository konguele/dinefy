import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart'; // Archivo generado por intl

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    // Establecer el locale predeterminado explícitamente
    Intl.defaultLocale = localeName;

    return initializeMessages(localeName).then((_) {
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Textos traducidos
  String get appTitle => Intl.message('Dinefy', name: 'appTitle');
  String get balance => Intl.message('Balance', name: 'balance');
  String get income => Intl.message('Income', name: 'income');
  String get expense => Intl.message('Expense', name: 'expense');
  String get addTransaction => Intl.message('Add Transaction', name: 'addTransaction');
  String get noData => Intl.message('No data', name: 'noData');
  String get close => Intl.message('Close', name: 'close');
  String get transactionsTitle => Intl.message('Transactions of the day', name: 'transactionsTitle');
  String get addIncome => Intl.message('Add Income', name: 'addIncome');
  String get addExpense => Intl.message('Add Expense', name: 'addExpense');
  String get amount => Intl.message('Amount (€)', name: 'amount');
  String get cancel => Intl.message('Cancel', name: 'cancel');
  String get save => Intl.message('Save', name: 'save');
  String get searchCategory => Intl.message('searchCategory', name: 'searchCategory');
  String get register => Intl.message('register', name: 'register');
  String get logout => Intl.message('logout', name: 'logout');
  String get changeLanguage => Intl.message('changeLanguage', name: 'changeLanguage');
  String get localeName => Intl.message('localeName', name: 'localeName');
}
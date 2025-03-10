import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart'; // Archivo generado por intl

class AppLocalizations {
  Locale _locale; // Variable para almacenar el locale actual

  AppLocalizations(this._locale); // Constructor para inicializar el locale

  // Getter para obtener el locale actual
  Locale get locale => _locale;

  // Método para cargar el locale
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    // Establecer el locale predeterminado explícitamente
    Intl.defaultLocale = localeName;

    return initializeMessages(localeName).then((_) {
      return AppLocalizations(locale); // Pasar el locale al constructor
    });
  }

  // Método para obtener la instancia de AppLocalizations desde el contexto
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Mapa de banderas
  static const Map<String, String> flagAssets = {
    'ca': 'assets/flags/ca.png', // Bandera de Cataluña
    'de': 'assets/flags/de.png', // Bandera de Alemania
    'en': 'assets/flags/en.png', // Bandera de Inglaterra
    'es': 'assets/flags/es.png', // Bandera de España
    'eu': 'assets/flags/eu.png', // Bandera del País Vasco
    'fr': 'assets/flags/fr.png', // Bandera de Francia
    'it': 'assets/flags/it.png', // Bandera de Italia
  };

  // Método para obtener la ruta de la bandera
  String getFlagAsset(String locale) {
    return flagAssets[locale] ?? 'assets/flags/en.png'; // Bandera por defecto si no se encuentra
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
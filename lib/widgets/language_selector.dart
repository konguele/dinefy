import 'package:flutter/material.dart';
import '../localization/app_localizations.dart'; // Importar AppLocalizations

class LanguageSelector extends StatelessWidget {
  final Function(Locale) changeLanguage; // Nuevo parámetro

  LanguageSelector({required this.changeLanguage});

  final List<Map<String, String>> languages = [
    {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
    {'code': 'ca', 'name': 'Català', 'flag': '🇦🇩'},
    {'code': 'eu', 'name': 'Euskara', 'flag': '🇪🇸'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
    {'code': 'it', 'name': 'Italiano', 'flag': '🇮🇹'},
    {'code': 'de', 'name': 'Deutsch', 'flag': '🇩🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.language),
      onPressed: () {
        _showLanguageDialog(context);
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).changeLanguage),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: languages.map((language) {
                return ListTile(
                  leading: Text(language['flag']!, style: TextStyle(fontSize: 24)),
                  title: Text(language['name']!),
                  onTap: () {
                    changeLanguage(Locale(language['code']!)); // Cambiar el idioma
                    Navigator.pop(context); // Cerrar el diálogo
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
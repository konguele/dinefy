import 'package:flutter/material.dart';
import '../localization/app_localizations.dart'; // Importar AppLocalizations
import 'flag_icon.dart'; // Importar el widget FlagIcon

class LanguageSelector extends StatelessWidget {
  final Function(Locale) changeLanguage; // Nuevo parámetro

  LanguageSelector({required this.changeLanguage});

  final List<Map<String, String>> languages = [
    {'code': 'es', 'name': 'Español'},
    {'code': 'ca', 'name': 'Català'},
    {'code': 'eu', 'name': 'Euskara'},
    {'code': 'en', 'name': 'English'},
    {'code': 'fr', 'name': 'Français'},
    {'code': 'it', 'name': 'Italiano'},
    {'code': 'de', 'name': 'Deutsch'},
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
                  leading: FlagIcon(
                    locale: language['code']!, // Usar el código del idioma
                    width: 24,
                    height: 24,
                  ),
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
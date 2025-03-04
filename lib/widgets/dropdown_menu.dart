import 'package:flutter/material.dart';
import '../localization/app_localizations.dart'; // Importar AppLocalizations
import 'language_selector.dart'; // Importar el nuevo widget LanguageSelector

class CustomDropdownMenu extends StatelessWidget {
  final bool isLoggedIn;
  final String username;
  final Function(Locale) changeLanguage; // Nuevo parámetro

  CustomDropdownMenu({
    required this.isLoggedIn,
    required this.username,
    required this.changeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'register',
            child: Container(
              width: double.infinity, // Ocupar todo el ancho disponible
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isLoggedIn)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar el menú
                        // Lógica para redirigir al registro
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Color de fondo
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Bordes redondeados
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        AppLocalizations.of(context).register, // Usar traducción
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  LanguageSelector(
                    changeLanguage: changeLanguage, // Pasar la función changeLanguage
                  ),
                ],
              ),
            ),
          ),
          if (isLoggedIn)
            PopupMenuItem<String>(
              value: 'logout',
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(AppLocalizations.of(context).logout), // Usar traducción
                onTap: () {
                  Navigator.pop(context); // Cerrar el menú
                  // Lógica para cerrar sesión
                },
              ),
            ),
        ];
      },
    );
  }
}
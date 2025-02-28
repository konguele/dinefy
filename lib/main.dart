import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para configurar la orientación
import 'package:intl/date_symbol_data_local.dart'; // Importar para inicializar el formato de fecha
import 'package:flutter_localizations/flutter_localizations.dart'; // Importar para soporte de localización
import 'screens/home_page.dart';
import 'localization/app_localizations.dart'; // Importar AppLocalizations
import 'localization/app_localizations_delegate.dart'; // Importar AppLocalizationsDelegate

void main() async {
  // Asegurar que Flutter esté inicializado
  WidgetsFlutterBinding.ensureInitialized();

  // Bloquear la orientación en vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Inicializar el formato de fecha para el idioma del dispositivo
  await initializeDateFormatting(); // Sin parámetros para usar el idioma del dispositivo

  runApp(MoneyfyApp());
}

class MoneyfyApp extends StatefulWidget {
  @override
  _MoneyfyAppState createState() => _MoneyfyAppState();
}

class _MoneyfyAppState extends State<MoneyfyApp> {
  Locale _locale = Locale('es', ''); // Idioma predeterminado: Español

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinefy', // Cambiado a 'Dinefy'
      theme: ThemeData(
        primaryColor: Color(0xFF3A0CA3),
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
        // Configurar la fuente Libre Baskerville como fuente predeterminada
        fontFamily: 'LibreBaskerville', // Nombre de la familia de fuentes definida en pubspec.yaml
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
          bodySmall: TextStyle(fontSize: 12.0),
        ),
      ),
      home: HomePage(
        isLoggedIn: false,
        username: '',
        changeLanguage: _changeLanguage, // Pasar la función _changeLanguage
      ),
      // Configurar localizaciones
      localizationsDelegates: [
        AppLocalizationsDelegate(), // Delegado personalizado para AppLocalizations
        GlobalMaterialLocalizations.delegate, // Delegado para Material Localizations
        GlobalWidgetsLocalizations.delegate, // Delegado para Widgets Localizations
      ],
      supportedLocales: [
        Locale('es', ''), // Español
        Locale('ca', ''), // Catalán
        Locale('eu', ''), // Euskera
        Locale('ga', ''), // Gallego
        Locale('en', ''), // Inglés
        Locale('fr', ''), // Francés
        Locale('it', ''), // Italiano
        Locale('de', ''), // Alemán
      ],
      locale: _locale, // Usar el idioma seleccionado
    );
  }
}
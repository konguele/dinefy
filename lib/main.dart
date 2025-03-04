import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para configurar la orientación
import 'package:intl/date_symbol_data_local.dart'; // Importar para inicializar el formato de fecha
import 'package:flutter_localizations/flutter_localizations.dart'; // Importar para soporte de localización
import 'package:provider/provider.dart'; // Importar provider
import 'screens/home_page.dart';
import 'localization/app_localizations.dart'; // Importar AppLocalizations
import 'localization/app_localizations_delegate.dart'; // Importar AppLocalizationsDelegate
import 'providers/settings_provider.dart'; // Importar SettingsProvider
import 'models/currency.dart'; // Importar el modelo Currency

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

  void _changeLanguage(Locale newLocale) async {
    // Crear una instancia del delegado
    final delegate = AppLocalizationsDelegate();

    // Cargar las traducciones para el nuevo idioma
    final localizations = await delegate.load(newLocale);

    if (localizations == null) {
      debugPrint('Error: No se pudieron cargar las traducciones para ${newLocale.languageCode}');
    } else {
      debugPrint('Idioma cambiado a ${newLocale.languageCode}');
      setState(() {
        _locale = newLocale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider(
        selectedCurrency: Currency(code: 'EUR', symbol: '€'), // Moneda predeterminada: Euro
        isDarkMode: false, // Tema predeterminado: Modo claro
      ),
      child: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
          return MaterialApp(
            title: 'Dinefy', // Cambiado a 'Dinefy'
            theme: settingsProvider.isDarkMode ? _buildDarkTheme() : _buildLightTheme(),
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
              GlobalCupertinoLocalizations.delegate, // Delegado para Cupertino Localizations
            ],
            supportedLocales: [
              Locale('es', ''), // Español
              Locale('ca', ''), // Catalán
              Locale('eu', ''), // Euskera
              Locale('en', ''), // Inglés
              Locale('fr', ''), // Francés
              Locale('it', ''), // Italiano
              Locale('de', ''), // Alemán
            ],
            locale: _locale, // Usar el idioma seleccionado
          );
        },
      ),
    );
  }

  // Tema claro personalizado
  ThemeData _buildLightTheme() {
    return ThemeData(
      primaryColor: Color(0xFF3A0CA3),
      scaffoldBackgroundColor: Color(0xFFF7F7F7),
      fontFamily: 'LibreBaskerville', // Fuente predeterminada
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black),
        bodySmall: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
    );
  }

  // Tema oscuro personalizado
  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF121212), // Fondo oscuro
      primaryColor: Color(0xFFBB86FC), // Color primario para el modo oscuro
      textTheme: ThemeData.dark().textTheme.copyWith(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'LibreBaskerville'),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'LibreBaskerville'),
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'LibreBaskerville'),
        bodySmall: TextStyle(fontSize: 12.0, color: Colors.white, fontFamily: 'LibreBaskerville'),
      ),
    );
  }
}
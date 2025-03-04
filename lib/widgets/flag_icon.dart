import 'package:flutter/material.dart';
import '../localization/app_localizations.dart'; // Importar AppLocalizations

class FlagIcon extends StatelessWidget {
  final String locale; // Código del idioma (por ejemplo, 'es', 'en', 'ca')
  final double width; // Ancho de la bandera
  final double height; // Alto de la bandera

  const FlagIcon({
    Key? key,
    required this.locale,
    this.width = 24,
    this.height = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Image.asset(
      localization.getFlagAsset(locale),
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        // Si la bandera no se encuentra, muestra una bandera por defecto
        return Image.asset(
          'assets/flags/en.png', // Bandera por defecto
          width: width,
          height: height,
        );
      },
    );
  }
}
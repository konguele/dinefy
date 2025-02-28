import 'package:flutter/material.dart';
import 'dart:math';
import '../data/categories.dart'; // Importar las categorías

class CategoryIcons extends StatelessWidget {
  final List<Map<String, dynamic>> commonCategories;
  final Function(String) onIconPressed;
  final Map<String, double> categoryPercentages; // Porcentajes de cada categoría

  CategoryIcons({
    required this.commonCategories,
    required this.onIconPressed,
    required this.categoryPercentages, // Añadir el nuevo parámetro
  });

  @override
  Widget build(BuildContext context) {
    // Aumentar el radio para que los iconos estén más abiertos
    final double radius = 160.0; // Aumenta este valor para abrir más los iconos
    // Ángulo entre cada icono (en radianes)
    final double angleIncrement = (2 * pi) / commonCategories.length;

    return Stack(
      alignment: Alignment.center,
      children: List.generate(commonCategories.length, (index) {
        // Calcular la posición de cada icono
        double angle = angleIncrement * index;
        double x = radius * cos(angle);
        double y = radius * sin(angle);

        // Obtener el nombre de la categoría
        String categoryName = commonCategories[index]['name'];

        // Obtener el color de la categoría desde commonCategoryColors
        Color categoryColor = commonCategoryColors[categoryName] ?? Colors.grey;

        // Verificar si hay un porcentaje para esta categoría
        bool hasPercentage = categoryPercentages.containsKey(categoryName);

        return Positioned(
          left: x + (MediaQuery.of(context).size.width / 2.05) - 5, // Centrar horizontalmente
          top: y + (MediaQuery.of(context).size.height / 3.8) - 5, // Centrar verticalmente
          child: IconButton(
            icon: Icon(
              commonCategories[index]['icon'],
              size: 30,
              color: hasPercentage ? categoryColor : Colors.black, // Negro inicial, cambia al color si hay porcentaje
            ),
            onPressed: () => onIconPressed(categoryName),
          ),
        );
      }),
    );
  }
}
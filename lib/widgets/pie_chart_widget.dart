import 'dart:math'; // Importar la clase Random
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction.dart';
import '../data/categories.dart'; // Importar las categorías

class PieChartWidget extends StatefulWidget {
  final List<Transaction> transactions;
  final double balance;

  const PieChartWidget({Key? key, required this.transactions, required this.balance}) : super(key: key);

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int? touchedIndex; // Índice de la sección tocada

  // Función para generar un color aleatorio
  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }

  // Calcular los totales por categoría
  Map<String, double> calculateCategoryTotals(List<Transaction> transactions) {
    Map<String, double> categoryTotals = {};
    for (var tx in transactions) {
      categoryTotals[tx.category] = (categoryTotals[tx.category] ?? 0) + tx.amount;
    }
    return categoryTotals;
  }

  @override
  Widget build(BuildContext context) {
    // Agrupar transacciones por categoría
    Map<String, double> categoryTotals = calculateCategoryTotals(widget.transactions);
    double totalIncome = 0;
    double totalExpense = 0;

    for (var tx in widget.transactions) {
      if (tx.amount > 0) {
        totalIncome += tx.amount;
      } else {
        totalExpense += tx.amount;
      }
    }

    bool hasTransactions = categoryTotals.isNotEmpty;

    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Sombra para simular relieve
          Transform.translate(
            offset: Offset(4, 4), // Desplazamiento de la sombra
            child: PieChart(
              PieChartData(
                sections: hasTransactions
                    ? categoryTotals.entries.map((entry) {
                        bool isIncome = entry.value > 0;
                        // Obtener el color de la categoría común o generar uno aleatorio
                        Color color = commonCategoryColors[entry.key] ?? getRandomColor();
                        return PieChartSectionData(
                          color: color.withOpacity(0.3), // Color más claro para la sombra
                          value: entry.value.abs(),
                          title: '',
                          radius: 70,
                        );
                      }).toList()
                    : [
                        PieChartSectionData(
                          color: Colors.grey.shade300.withOpacity(0.3),
                          value: 1,
                          title: '',
                          radius: 70,
                        )
                      ],
                sectionsSpace: 2,
                centerSpaceRadius: 50,
              ),
            ),
          ),
          // Gráfico principal
          PieChart(
            PieChartData(
              sections: hasTransactions
                  ? categoryTotals.entries.map((entry) {
                      bool isIncome = entry.value > 0;
                      double total = isIncome ? totalIncome : totalExpense;
                      double percentage = (entry.value.abs() / total) * 100;

                      // Obtener el color de la categoría común o generar uno aleatorio
                      Color color = commonCategoryColors[entry.key] ?? getRandomColor();
                      return PieChartSectionData(
                        color: color,
                        value: entry.value.abs(),
                        title: touchedIndex == categoryTotals.keys.toList().indexOf(entry.key)
                            ? '${entry.key}\n${percentage.toStringAsFixed(1)}%' // Mostrar solo si está seleccionado
                            : '',
                        radius: touchedIndex == categoryTotals.keys.toList().indexOf(entry.key) ? 75 : 70, // Resaltar la sección tocada
                        titleStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Color del texto para mejor contraste
                        ),
                      );
                    }).toList()
                  : [
                      PieChartSectionData(
                        color: Colors.grey.shade300,
                        value: 1,
                        title: '',
                        radius: 70,
                      )
                    ],
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = null;
                      return;
                    }
                    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
            ),
          ),
          // Texto en el centro
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${totalIncome.toStringAsFixed(2)} €',
                style: TextStyle(
                  fontSize: 14, // Reducir el tamaño de la fuente
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 4), // Espacio entre los textos
              Text(
                '${totalExpense.toStringAsFixed(2)} €',
                style: TextStyle(
                  fontSize: 14, // Reducir el tamaño de la fuente
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              if (!hasTransactions)
                Text(
                  'No hay datos',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
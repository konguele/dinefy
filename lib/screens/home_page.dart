import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../data/categories.dart'; // Importar las categorías
import '../widgets/calendar_widget.dart';
import '../widgets/balance_buttons.dart'; // Importar el nuevo BalanceButtons
import '../widgets/transaction_list_dialog.dart';
import '../models/transaction.dart';
import '../widgets/category_icons.dart' as category_icons;
import '../widgets/pie_chart_widget.dart' as pie_chart;
import '../localization/app_localizations.dart'; // Importar AppLocalizations
import '../widgets/dropdown_menu.dart' as custom; // Importar el nuevo DropdownMenu
import '../widgets/flag_icon.dart'; // Importar el widget FlagIcon
import '../widgets/settings_drawer.dart'; // Importar el SettingsDrawer
import '../providers/settings_provider.dart'; // Importar el SettingsProvider
import '../models/currency.dart'; // Importar el modelo Currency

class HomePage extends StatefulWidget {
  final bool isLoggedIn; // Nuevo parámetro
  final String username; // Nuevo parámetro
  final Function(Locale) changeLanguage; // Nuevo parámetro

  HomePage({
    required this.isLoggedIn,
    required this.username,
    required this.changeLanguage, // Añadir changeLanguage
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double balance = 0;
  double expenses = 0;
  double income = 0;
  List<Transaction> transactions = [];
  Map<DateTime, List<Transaction>> groupedTransactions = {};

  void addTransaction(String category, double amount, bool isIncome, DateTime date) {
    setState(() {
      if (isIncome) {
        income += amount;
        balance += amount;
      } else {
        expenses += amount;
        balance -= amount;
      }
      Transaction transaction = Transaction(category: category, amount: isIncome ? amount : -amount, date: date);
      transactions.add(transaction);

      // Normalizar la fecha para agrupar correctamente
      DateTime normalizedDate = DateTime(date.year, date.month, date.day);
      if (groupedTransactions[normalizedDate] == null) {
        groupedTransactions[normalizedDate] = [];
      }
      groupedTransactions[normalizedDate]!.add(transaction);
    });
  }

  void showTransactionsDialog(BuildContext context, DateTime selectedDay) {
    // Normalizar la fecha para comparar sin la hora
    DateTime normalizedDate = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

    // Obtener las transacciones del día seleccionado
    List<Transaction> dailyTransactions = groupedTransactions[normalizedDate] ?? [];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)?.addTransaction ?? 'Add Transaction'), // Usar traducción
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: dailyTransactions.map((transaction) {
              return ListTile(
                leading: Icon(
                  transaction.amount > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: transaction.amount > 0 ? Colors.green : Colors.red,
                ),
                title: Text(transaction.category),
                subtitle: Text('${transaction.amount.toStringAsFixed(2)} €'),
                trailing: Text(
                  '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)?.close ?? 'Close'), // Usar traducción
            ),
          ],
        );
      },
    );
  }

  void showAllTransactionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TransactionListDialog(dailyTransactions: transactions);
      },
    );
  }

  void addIncomeTransaction() {
    showDialog(
      context: context,
      builder: (context) {
        String selectedCategory = incomeCategories.first['name'] as String;
        TextEditingController amountController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)?.addTransaction ?? 'Add Transaction'), // Usar traducción
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedCategory,
                    items: incomeCategories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category['name'] as String,
                        child: Row(
                          children: [
                            Icon(category['icon'], color: Color(0xFF4895EF)),
                            SizedBox(width: 10),
                            Text(category['name'] as String),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)?.amount ?? 'Amount', // Usar traducción
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'), // Usar traducción
                ),
                TextButton(
                  onPressed: () {
                    double? amount = double.tryParse(amountController.text);
                    if (amount != null) {
                      addTransaction(selectedCategory, amount, true, DateTime.now());
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppLocalizations.of(context)?.save ?? 'Save'), // Usar traducción
                ),
              ],
            );
          },
        );
      },
    );
  }

  void addExpenseTransaction() {
    showDialog(
      context: context,
      builder: (context) {
        String selectedCategory = expenseCategories.first['name'] as String;
        TextEditingController amountController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)?.addTransaction ?? 'Add Transaction'), // Usar traducción
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedCategory,
                    items: expenseCategories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category['name'] as String,
                        child: Row(
                          children: [
                            Icon(category['icon'], color: Color(0xFF4895EF)),
                            SizedBox(width: 10),
                            Text(category['name'] as String),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)?.amount ?? 'Amount', // Usar traducción
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'), // Usar traducción
                ),
                TextButton(
                  onPressed: () {
                    double? amount = double.tryParse(amountController.text);
                    if (amount != null) {
                      addTransaction(selectedCategory, amount, false, DateTime.now());
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppLocalizations.of(context)?.save ?? 'Save'), // Usar traducción
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Función para calcular los porcentajes de cada categoría
  Map<String, double> calculateCategoryPercentages(List<Transaction> transactions) {
    Map<String, double> categoryTotals = {};
    double totalIncome = 0;
    double totalExpense = 0;

    // Inicializar todas las categorías comunes con un valor de 0
    for (var category in commonCategories) {
      categoryTotals[category['name']] = 0;
    }

    // Calcular los totales de cada categoría
    for (var tx in transactions) {
      if (categoryTotals.containsKey(tx.category)) {
        categoryTotals[tx.category] = (categoryTotals[tx.category] ?? 0) + tx.amount;
        if (tx.amount > 0) {
          totalIncome += tx.amount;
        } else {
          totalExpense += tx.amount;
        }
      }
    }

    // Calcular los porcentajes
    Map<String, double> categoryPercentages = {};
    categoryTotals.forEach((category, amount) {
      double total = amount > 0 ? totalIncome : totalExpense;
      if (total > 0) {
        categoryPercentages[category] = (amount.abs() / total) * 100;
      } else {
        categoryPercentages[category] = 0; // Si no hay transacciones, el porcentaje es 0
      }
    });

    // Depuración: Mostrar porcentajes calculados
    debugPrint('Porcentajes calculados:');
    categoryPercentages.forEach((category, percentage) {
      debugPrint('Categoría: $category, Porcentaje: $percentage%');
    });

    return categoryPercentages;
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    // Calcular los porcentajes de cada categoría
    Map<String, double> categoryPercentages = calculateCategoryPercentages(transactions);

    // Depuración: Verificar que categoryPercentages se actualiza
    debugPrint('categoryPercentages en build: $categoryPercentages');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appTitle ?? 'Dinefy'), // Usar traducción
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
          custom.CustomDropdownMenu(
            isLoggedIn: widget.isLoggedIn, // Usar el valor de isLoggedIn
            username: widget.username, // Usar el valor de username
            changeLanguage: widget.changeLanguage, // Pasar la función changeLanguage
          ),
        ],
      ),
      endDrawer: SettingsDrawer(
        currencies: [
          Currency(code: 'USD', symbol: '\$'),
          Currency(code: 'EUR', symbol: '€'),
          Currency(code: 'GBP', symbol: '£'),
          // Agrega más monedas según sea necesario
        ],
        selectedCurrency: settingsProvider.selectedCurrency,
        onCurrencyChanged: (newCurrency) {
          settingsProvider.setCurrency(newCurrency);
        },
        isDarkMode: settingsProvider.isDarkMode,
        onThemeChanged: (newValue) {
          settingsProvider.toggleTheme(newValue);
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CalendarWidget(
            groupedTransactions: groupedTransactions,
            onDaySelected: (selectedDay) {
              showTransactionsDialog(context, selectedDay);
            },
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  pie_chart.PieChartWidget(
                    transactions: transactions,
                    balance: balance,
                  ),
                  // Widget CategoryIcons con los iconos en círculo
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width, // Usar el ancho de la pantalla
                      height: 400,
                      child: category_icons.CategoryIcons(
                        commonCategories: commonCategories,
                        onIconPressed: (category) {
                          addTransactionWithCategory(category);
                        },
                        categoryPercentages: categoryPercentages, // Pasar los porcentajes
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BalanceButtons(
            balance: balance,
            onAddIncome: addIncomeTransaction,
            onAddExpense: addExpenseTransaction,
            transactions: transactions, // Pasar la lista de transacciones
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void addTransactionWithCategory(String selectedCategory) {
    Map<String, dynamic> selectedCategoryMap = commonCategories.firstWhere(
      (category) => category['name'] == selectedCategory,
      orElse: () => {'name': '', 'icon': Icons.error, 'isIncome': false},
    );

    bool isIncome = selectedCategoryMap['isIncome'] as bool;

    showDialog(
      context: context,
      builder: (context) {
        TextEditingController amountController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(isIncome
                  ? AppLocalizations.of(context)?.addTransaction ?? 'Add Transaction' // Usar traducción
                  : AppLocalizations.of(context)?.addTransaction ?? 'Add Transaction'), // Usar traducción
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(selectedCategoryMap['icon'], color: Color(0xFF4895EF)),
                      SizedBox(width: 10),
                      Text(selectedCategoryMap['name']),
                    ],
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)?.amount ?? 'Amount', // Usar traducción
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'), // Usar traducción
                ),
                TextButton(
                  onPressed: () {
                    double? amount = double.tryParse(amountController.text);
                    if (amount != null && selectedCategoryMap['name'] != '') {
                      addTransaction(selectedCategory, amount, isIncome, DateTime.now());
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppLocalizations.of(context)?.save ?? 'Save'), // Usar traducción
                ),
              ],
            );
          },
        );
      },
    );
  }
}
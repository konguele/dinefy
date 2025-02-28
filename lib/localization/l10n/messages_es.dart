// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.
// @dart=2.12
// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'es';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Añadir Gasto'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Añadir Ingreso'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Añadir Transacción'),
    'amount': MessageLookupByLibrary.simpleMessage('Importe (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Balance'),
    'cancel': MessageLookupByLibrary.simpleMessage('Cancelar'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Idioma'),
    'close': MessageLookupByLibrary.simpleMessage('Cerrar'),
    'expense': MessageLookupByLibrary.simpleMessage('Gastos'),
    'income': MessageLookupByLibrary.simpleMessage('Ingresos'),
    'localeName': MessageLookupByLibrary.simpleMessage('es'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexión'),
    'noData': MessageLookupByLibrary.simpleMessage('No hay datos'),
    'register': MessageLookupByLibrary.simpleMessage('Registro'),
    'save': MessageLookupByLibrary.simpleMessage('Guardar'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Categoría'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Transacciones del día')
  };
}

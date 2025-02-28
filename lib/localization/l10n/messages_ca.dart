// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ca locale. All the
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
  String get localeName => 'ca';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Afegir Despesa'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Afegir Ingres'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Afegir Transacció'),
    'amount': MessageLookupByLibrary.simpleMessage('Import (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Balanç'),
    'cancel': MessageLookupByLibrary.simpleMessage('Cancel·lar'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Llengua'),
    'close': MessageLookupByLibrary.simpleMessage('Tancar'),
    'expense': MessageLookupByLibrary.simpleMessage('Despeses'),
    'income': MessageLookupByLibrary.simpleMessage('Ingressos'),
    'localeName': MessageLookupByLibrary.simpleMessage('ca'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexió'),
    'noData': MessageLookupByLibrary.simpleMessage('No hi ha dades'),
    'register': MessageLookupByLibrary.simpleMessage('Registre'),
    'save': MessageLookupByLibrary.simpleMessage('Guardar'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Categoria'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Transaccions del dia')
  };
}

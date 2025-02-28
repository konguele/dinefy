// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Aggiungi Spesa'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Aggiungi Entrata'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Aggiungi Transazione'),
    'amount': MessageLookupByLibrary.simpleMessage('Importo (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Saldo'),
    'cancel': MessageLookupByLibrary.simpleMessage('Annulla'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Llengua'),
    'close': MessageLookupByLibrary.simpleMessage('Chiudi'),
    'expense': MessageLookupByLibrary.simpleMessage('Spese'),
    'income': MessageLookupByLibrary.simpleMessage('Entrate'),
    'localeName': MessageLookupByLibrary.simpleMessage('it'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexió'),
    'noData': MessageLookupByLibrary.simpleMessage('Nessun dato'),
    'register': MessageLookupByLibrary.simpleMessage('Registre'),
    'save': MessageLookupByLibrary.simpleMessage('Salva'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Speichern'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Transazioni del giorno')
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Ausgabe hinzufügen'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Einkommen hinzufügen'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Transaktion hinzufügen'),
    'amount': MessageLookupByLibrary.simpleMessage('Betrag (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Saldo'),
    'cancel': MessageLookupByLibrary.simpleMessage('Abbrechen'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Llengua'),
    'close': MessageLookupByLibrary.simpleMessage('Schließen'),
    'expense': MessageLookupByLibrary.simpleMessage('Ausgaben'),
    'income': MessageLookupByLibrary.simpleMessage('Einkommen'),
    'localeName': MessageLookupByLibrary.simpleMessage('de'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexió'),
    'noData': MessageLookupByLibrary.simpleMessage('Keine Daten'),
    'register': MessageLookupByLibrary.simpleMessage('Registre'),
    'save': MessageLookupByLibrary.simpleMessage('Speichern'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Speichern'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Transaktionen des Tages')
  };
}

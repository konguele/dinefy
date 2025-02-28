// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a eu locale. All the
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
  String get localeName => 'eu';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Gehitu Gastua'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Gehitu Sarrera'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Gehitu Transakzioa'),
    'amount': MessageLookupByLibrary.simpleMessage('Kopurua (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Saldoa'),
    'cancel': MessageLookupByLibrary.simpleMessage('Utzi'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Llengua'),
    'close': MessageLookupByLibrary.simpleMessage('Itxi'),
    'expense': MessageLookupByLibrary.simpleMessage('Gastuak'),
    'income': MessageLookupByLibrary.simpleMessage('Sarrerak'),
    'localeName': MessageLookupByLibrary.simpleMessage('eu'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexió'),
    'noData': MessageLookupByLibrary.simpleMessage('Ez dago daturik'),
    'register': MessageLookupByLibrary.simpleMessage('Registre'),
    'save': MessageLookupByLibrary.simpleMessage('Gorde'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Speichern'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Eguneko transakzioak')
  };
}

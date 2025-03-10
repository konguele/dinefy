// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addExpense': MessageLookupByLibrary.simpleMessage('Ajouter une dépense'),
    'addIncome': MessageLookupByLibrary.simpleMessage('Ajouter un revenu'),
    'addTransaction': MessageLookupByLibrary.simpleMessage('Ajouter une transaction'),
    'amount': MessageLookupByLibrary.simpleMessage('Montant (€)'),
    'appTitle': MessageLookupByLibrary.simpleMessage('Dinefy'),
    'balance': MessageLookupByLibrary.simpleMessage('Solde'),
    'cancel': MessageLookupByLibrary.simpleMessage('Annuler'),
    'changeLanguage': MessageLookupByLibrary.simpleMessage('Llengua'),
    'close': MessageLookupByLibrary.simpleMessage('Fermer'),
    'expense': MessageLookupByLibrary.simpleMessage('Dépenses'),
    'income': MessageLookupByLibrary.simpleMessage('Revenus'),
    'localeName': MessageLookupByLibrary.simpleMessage('fr'),
    'logout': MessageLookupByLibrary.simpleMessage('Desconexió'),
    'noData': MessageLookupByLibrary.simpleMessage('Aucune donnée'),
    'register': MessageLookupByLibrary.simpleMessage('Registre'),
    'save': MessageLookupByLibrary.simpleMessage('Enregistrer'),
    'searchCategory': MessageLookupByLibrary.simpleMessage('Speichern'),
    'transactionsTitle': MessageLookupByLibrary.simpleMessage('Transactions du jour')
  };
}

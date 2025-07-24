import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:listacontato/features/contact/domain/models/contato.dart';

class ContactRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final List<Contato> _contacts = [];

  static final String _storageKey = 'contacts';
  List<Contato> get contacts => List.unmodifiable(_contacts);

  Future<void> addContact(Contato contato) async {
    _contacts.add(contato);
    await _saveContacts();
  }

  Future<void> removeContact(String id) async {
    _contacts.removeWhere((contato) => contato.id == id);
    await _saveContacts();
  }

  Future<void> _saveContacts() async {
    final contactsJson = _contacts.map((contacts) => contacts.toJson()).toList();
    final jsonString = jsonEncode(contactsJson); 
    await _storage.write(key: _storageKey, value: jsonString);
  }

  Future<void> loadContacts() async {
    final jsonString = await _storage.read(key: _storageKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      _contacts.clear();
      _contacts.addAll(jsonList.map((json) => Contato.fromJson(json)).toList());
    }
  }
}
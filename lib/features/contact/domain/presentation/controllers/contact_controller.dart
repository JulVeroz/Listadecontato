import 'package:flutter/material.dart';
import 'package:listacontato/features/contact/domain/models/contato.dart';
import 'package:listacontato/features/contact/domain/repositories/contact_repository.dart';

class ContactController extends ChangeNotifier {
  final ContactRepository _contactRepository; // Repositório de contatos
  bool carregado;

  ContactController(this._contactRepository) : carregado = false; // Inicializa o carregamento como falso

  List<Contato> get contatos => _contactRepository.contacts; // Lista de contatos

  Contato getContatoById(String id) {
    return _contactRepository.contacts.firstWhere(
      (contato) => contato.id == id,
      orElse: () => Contato(id: '', telefone: '', email: ''), // Se der erro volte aqui.
    );
  }

  Future<void> addContact(Contato contato) async {
    await _contactRepository.addContact(contato);
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  Future<void> removeContact(String id) async {
    await _contactRepository.removeContact(id);
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  Future<void> loadContacts() async {
    if (carregado) return; // Se já estiver carregado, não faz nada
    await _contactRepository.loadContacts();
    carregado = true; // Marca como carregado
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }
}
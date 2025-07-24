class Contato {
  static int _contador = 0;

  final String id;
  final String telefone;
  final String email;

  Contato({
    String? id,
    required this.telefone,
    required this.email,
  }) : id = id ?? _gerarID();

  static String _gerarID() {
    _contador++;
    return 'contato_$_contador';
  }

  Contato copyWith({
    String? id,
    String? telefone,
    String? email,
  }) {
    return Contato(
      id: id ?? this.id,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
    );
  }
  @override
  String toString() {
    return 'Contato(nome: $id, telefone: $telefone, email: $email)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'telefone': telefone,
      'email': email,
    };
  }

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      id: json['id'] as String,
      telefone: json['telefone'] as String,
      email: json['email'] as String,
    );
  }
}
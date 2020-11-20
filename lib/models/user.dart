import 'package:flutter/material.dart';

class User {
  final String id;
  final String nome;
  final String telefone;
  final String cep;
  final String qtdMembros;

  const User({
    this.id,
    @required this.nome,
    @required this.telefone,
    @required this.cep,
    @required this.qtdMembros,
  });
}

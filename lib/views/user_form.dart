import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prova/models/user.dart';
import 'package:flutter_prova/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['telefone'] = user.telefone;
      _formData['cep'] = user.cep;
      _formData['qtdMembros'] = user.qtdMembros;
    }
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    //DEBUG PARA VER SE ELEMENTO DO MAP ESTÁ SENDO RECUPERADO
    // print(user.nome);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState.save();

              Provider.of<Users>(context, listen: false).put(User(
                id: _formData['id'],
                nome: _formData['nome'],
                telefone: _formData['telefone'],
                cep: _formData['cep'],
                qtdMembros: _formData['qtdMembros'],
              ));

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['telefone'],
                decoration: InputDecoration(labelText: 'Telefone com o DDD:'),
                onSaved: (value) => _formData['telefone'] = value,
              ),
              TextFormField(
                initialValue: _formData['cep'],
                decoration: InputDecoration(labelText: 'CEP'),
                onSaved: (value) => _formData['cep'] = value,
              ),
              TextFormField(
                initialValue: _formData['qtdMembros'],
                decoration:
                    InputDecoration(labelText: 'Quantidade de residentes'),
                onSaved: (value) => _formData['qtdMembros'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

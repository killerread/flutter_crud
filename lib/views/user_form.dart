// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user ) {
    if(user!= null){
          _formData['id'] = user.id;
     _formData['name'] = user.name;
      _formData['email'] = user.email;
       _formData['avatarUrl'] = user.avatarUrl;
        _formData['numero'] = user.numero;
    }

  }
  @override
  Widget build(BuildContext context) {
    final Object? user = ModalRoute.of(context)!.settings.arguments; 
    print(user?.name);
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Formulario de Usuário'),
        actions: <Widget>[
          IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.save),
            onPressed: () {
              bool isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState?.save();
                Provider.of<User>(context).put(User(
                 id: _formData['id'],
                 name: _formData['name']
                 email: _formData['email']
                 avatarUrl:_formData['avatarUrl']
                 numero: _formData['numero'] 
                ));
              }
              {}
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(
                    label: const Text('Nome '),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nome inválido';
                      }
                      if (value.trim().length < 3) {
                        return 'Nmome muito pequeno. No mínimo 3 lertras.';
                      }
                    },
                    onSaved: (value) => _formData['name'] = value,
                  ),
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(
                      label: Text('E-mail'),
                      onSaved: (value) => _formData['email'] = value),
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: const InputDecoration(
                      label: Text('URL do avatar'),
                      onSaved: (value) => _formData['avatarUrl'] = value),
                ),
                TextFormField(
                  initialValue: _formData['numero'],
                    decoration: const InputDecoration(
                        label: Text('Número'),
                        onSaved: (value) => _formData['numero'] = value)),
              ],
            )),
      ),
    );
  }
}

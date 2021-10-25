import 'dart:js';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wigtes_atividade/app/View/produto_form_back.dart';

class cadastro_produto extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldProduto(ProdutoFormBack back) {
    return TextFormField(
        validator: back.validateProduto,
        onSaved: (newValue) => back.produto.produto = newValue,
        initialValue: back.produto.produto,
        decoration: InputDecoration(labelText: 'Produto'));
  }

  Widget fieldMarca(ProdutoFormBack back) {
    return TextFormField(
        validator: back.validateMarca,
        onSaved: (newValue) => back.produto.marca = newValue,
        initialValue: back.produto.marca,
        decoration: InputDecoration(labelText: 'Marca'));
  }

  Widget fieldValor(ProdutoFormBack back) {
    return TextFormField(
        validator: back.validateValor,
        onSaved: (newValue) => back.produto.valor = newValue,
        initialValue: back.produto.valor,
        decoration: InputDecoration(labelText: 'Valor'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ProdutoFormBack(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Produtos'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  _form.currentState!.validate();
                  _form.currentState!.save();
                  if (_back.isValid) {
                    _back.save();
                    Navigator.of(context).pop();
                  }
                })
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
                key: _form,
                child: Column(
                  children: [
                    fieldProduto(_back),
                    fieldMarca(_back),
                    fieldValor(_back),
                  ],
                ))));
  }
}

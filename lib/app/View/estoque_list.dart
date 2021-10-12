import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wigtes_atividade/app/Database/conexao.dart';
import 'package:wigtes_atividade/app/MyApp.dart';
import 'package:wigtes_atividade/app/Database/sqlite/dao/produto_dao_imple.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

class estoque_list extends StatelessWidget {
  final list = [
    {'produto': 'celular', 'marca': 'LG', 'valor': '1500'},
    {'produto': 'notebook', 'marca': 'Acer', 'valor': '2600'},
    {'produto': 'tablet', 'marca': 'Positivo', 'valor': '650'},
  ];

  var _back;

  Future<List<Produtos>> encontrar() async {
    return ProdutoDAOimple().find();
  }

  Widget editarBotao(Function onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.black, onPressed: onPressed());
  }

  Widget iconRemoveButton(BuildContext contexto, Function remover) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          contexto:
          builder:
          (contexto) => AlertDialog(
                title: Text('Excluir'),
                content: Text('Confirma a Exclusão?'),
                actions: [
                  FlatButton(
                    child: Text('Não'),
                    onPressed: () {
                      Navigator.of(contexto).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Sim'),
                    onPressed: remover(),
                  ),
                ],
              );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Estoque'), actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.CADASTRO_PRODUTO);
            },
            icon: Icon(Icons.add),
          )
        ]),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: encontrar(),
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  var lista = futuro.data;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      var produtos = list[i];
                      return ListTile(
                          title: Text('${produtos['produto']}'),
                          subtitle: Text('${produtos['valor']}'),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                editarBotao(() {
                                  _back.goToForm(context, produtos);
                                }),
                                iconRemoveButton(context, () {
                                  _back.remover(produtos);
                                  Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ));
                    },
                  );
                }
              });
        }));
  }
}

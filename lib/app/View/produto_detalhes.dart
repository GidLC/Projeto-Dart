import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wigtes_atividade/app/View/produto_detalhes_back.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

class Produtodetalhes extends StatelessWidget {
  launchApp(String url, context) async {
    await canLaunch(url)
        ? launch(url)
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alerta!!!!!'),
                content: Text('App não disponível.'),
              );
            });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ProdutoDetalhesBack(context);

    Produtos produtos = _back.produto;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var height = constraints.biggest.height;

        return Scaffold(
            body: ListView(children: [
              Center(
                child: Text(
                  '${produtos.produto}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Card(
                child: ListTile(
                    title: Text('Marca'), subtitle: Text('${produtos.marca}')),
              ),
              Card(
                child: ListTile(
                    title: Text('Valor'),
                    subtitle: Text('${produtos.valor}'),
                    trailing: Container(
                        width: width / 4,
                        child: Row(children: [
                          IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.calculate),
                              onPressed: () {
                                launchApp('cal:${produtos.valor}', context);
                              })
                        ]))),
              ),
            ]),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  _back.goToBack();
                }));
      },
    );
  }
}

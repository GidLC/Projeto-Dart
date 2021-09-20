import 'package:flutter/material.dart';
import 'package:wigtes_atividade/app/MyApp.dart';

class estoque_list extends StatelessWidget {
  final list = [
    {'produto': 'celular', 'marca': 'LG', 'valor': '1500'},
    {'produto': 'notebook', 'marca': 'Acer', 'valor': '2600'},
    {'produto': 'tablet', 'marca': 'Positivo', 'valor': '650'},
  ];

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
        body: ListView.builder(
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
                      IconButton(icon: Icon(Icons.edit), onPressed: null),
                      IconButton(icon: Icon(Icons.delete), onPressed: null),
                    ],
                  ),
                ));
          },
        ));
  }
}

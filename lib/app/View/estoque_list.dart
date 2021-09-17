import 'package:flutter/material.dart';

class estoque_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estoque'), actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('cadastro_produto');
          },
          icon: Icon(Icons.add),
        )
      ]),
      body: ListView(),
    );
  }
}

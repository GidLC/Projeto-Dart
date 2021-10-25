import 'package:flutter/cupertino.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

class ProdutoDetalhesBack {
  BuildContext context;
  late Produtos produto;

  ProdutoDetalhesBack(this.context) {
    produto = ModalRoute.of(context)!.settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}

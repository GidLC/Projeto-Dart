import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';
import 'package:wigtes_atividade/app/dominio/interface/produto_dao.dart';

class ProdutoDAOFirestore implements ProdutoDAO {
  late CollectionReference produtoColecao;

  ProdutoDAOFirestore() {
    produtoColecao = Firestore.instance.collection('produtos');
  }
  @override
  Future<List<Produtos>> find() {
    var resultado = produtoColecao.snapshots.listen((event) {});
    return (find());
  }

  @override
  remove(id) {
    produtoColecao.document(id).delete();
  }

  @override
  save(Produtos produto) {
    produtoColecao.document(produto.id).setData({
      'produto': produto.produto,
      'marca': produto.marca,
      'valor': produto.valor
    });
  }
}

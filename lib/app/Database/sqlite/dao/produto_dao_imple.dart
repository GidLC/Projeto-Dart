import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';
import 'package:wigtes_atividade/app/dominio/interface/produto_dao.dart';

import '../connection.dart';

class ProdutoDAOimple implements ProdutoDAO {
  late Database bd;

  get Connection => '';

  @override
  Future<List<Produtos>> find() async {
    bd = await Connection.get;
    bd.query('produto');
    List<Map<String, dynamic>> resultado = await bd.query('produtos');
    List<Produtos> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Produtos(
         id: linha['id'],marca : linha['marca'], produto : linha['produto'], valor : linha['valor']);
    });
    return lista;
  }

  @override
  remove(dynamic id) async {
    bd = await Connection.get();
    var sql = 'DELETE FROM produtos WHERE id = ?';
    bd.rawDelete(sql, [id]);
  }

  @override
  save(Produtos produtos) async {
    // ignore: unnecessary_statements
    bd = await Connection.get();
    var sql;
    if (produtos.id == null) {
      sql = 'INSERT INTO produtos(produto,marca,valor) VALUES(?,?,?)';
      bd.rawInsert(sql, [produtos.produto, produtos.marca, produtos.valor]);
    } else {
      sql = 'UPDATE produtos SET produto =?,marca=?,valor=? WHERE id=?';
      bd.rawUpdate(sql, [produtos.produto, produtos.marca, produtos.valor]);
    }
  }
}

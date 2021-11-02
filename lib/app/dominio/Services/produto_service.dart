import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:wigtes_atividade/app/Database/sqlite/dao/produto_dao_imple.dart';
import 'package:wigtes_atividade/app/dominio/Exe%C3%A7%C3%A3o/Dominio_Exce%C3%A7%C3%A3o.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';
import 'package:wigtes_atividade/app/dominio/interface/produto_dao.dart';

class ProdutoService {
  var dao = GetIt.I.get<ProdutoDAO>();
  //tem que salvar um produto, podendo altera-lo, salva-lo e lista-lo
  save(Produtos produto) {
    dao.save(produto);
  }

  remove(dynamic id) {
    dao.remove(id);
  }

  find() {
    return dao.find();
  }

  //produto = obrigatório, com no maximo 30 caracteres e no minimo 3
  validarProduto(String produto) {
    var max = 30;
    var min = 3;
    if (produto == null) {
      throw new Dominio_Excecao('O nome do produto está errado');
    } else if (produto.length < min) {
      throw new Dominio_Excecao('Esse produto é inexistente');
    } else if (produto.length > max) {
      throw new Dominio_Excecao('Nome do produto muito grande. MAX= $max');
    }
  }

  // marca = obrigatório, com no maximo 15 caracteres, minimo 5
  validarMarca(String marca) {
    var max = 15;
    var min = 5;
    if (marca == null) {
      throw new Dominio_Excecao('A marca do produto está errada');
    } else if (marca.length < min) {
      throw new Dominio_Excecao('Essa marca é inexistente');
    } else if (marca.length > max) {
      throw new Dominio_Excecao('Nome da marca muito grande. MAX= $max');
    }
  }

  //valor = obrigatório, ser maior que 0.
  validarValor(double valor) {
    var max = 15;
    var min = 5;
    if (valor == null) {
      throw new Dominio_Excecao('O valor deve ser diferente de 0');
    } else if (valor < 0) {
      throw new Dominio_Excecao('O valor não pode ser negativo');
    }
  }
}

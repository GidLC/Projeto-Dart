import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:wigtes_atividade/app/dominio/Services/produto_service.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

class ProdutoFormBack {
  late Produtos produto;
  var _service = GetIt.I.get<ProdutoService>();
  bool _produtoValido = 0 as bool;
  bool _marcaValida = 0 as bool;
  bool _valorValido = 0 as bool;

  bool get isValid => _produtoValido && _marcaValida && _valorValido;

  ProdutoFormBack(BuildContext context) {
    var parametros = ModalRoute.of(context)!.settings.arguments;
    produto = (parametros == null)
        ? Produtos(marca: '', produto: '', valor: '')
        : parametros;
  }

  save() async {
    await _service.save(produto);
  }

  String? validateProduto(var produto) {
    try {
      _service.validarProduto(produto);
      _produtoValido = true;
      return null;
    } catch (e) {
      _produtoValido = false;
      return e.toString();
    }
  }

  String? validateMarca(var marca) {
    try {
      _service.validarMarca(marca);
      _marcaValida = true;
      return null;
    } catch (e) {
      _marcaValida = false;
      return e.toString();
    }
  }

  String? validateValor(var valor) {
    try {
      _service.validarValor(valor);
      _valorValido = true;
      return null;
    } catch (e) {
      _valorValido = false;
      return e.toString();
    }
  }
}

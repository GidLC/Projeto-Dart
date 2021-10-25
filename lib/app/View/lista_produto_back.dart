import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:wigtes_atividade/app/MyApp.dart';
import 'package:wigtes_atividade/app/dominio/Services/produto_service.dart';
import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

part 'lista_produto_back.g.dart';

class ListaProdutoBack = _ListaProdutoBack with _$ListaProdutoBack;

abstract class _ListaProdutoBack with Store {
  var _service = GetIt.I.get<ProdutoService>();

  @observable
  late Future<List<Produtos>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ListaProdutoBack() {
    refreshList();
  }

  goToForm(BuildContext contexto, Produtos produtos) {
    Navigator.of(contexto)
        .pushNamed(MyApp.CADASTRO_PRODUTO, arguments: produtos)
        .then(refreshList);
  }

  GoToDetails(BuildContext context, [Produtos? produtos]) {
    Navigator.of(context)
        .pushNamed(MyApp.PRODUTO_DETALHES, arguments: produtos);
  }

  remover(int id) {
    _service.remove(id);
    refreshList();
  }
}

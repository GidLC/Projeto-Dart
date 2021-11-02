import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

abstract class ProdutoDAO {
  save(Produtos produto);

  remove(dynamic id);

  Future<List<Produtos>> find();
}

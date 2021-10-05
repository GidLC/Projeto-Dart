import 'package:wigtes_atividade/app/dominio/entidade/produto.dart';

abstract class ProdutoDAO {
  save(Produtos produto);

  remove(int id);

  Future<List<Produtos>> find();
}

import 'package:get_it/get_it.dart';
import 'package:wigtes_atividade/app/Database/sqlite/dao/produto_dao_imple.dart';
import 'package:wigtes_atividade/app/dominio/Services/produto_service.dart';

import 'dominio/interface/produto_dao.dart';

setupInjection() {
  GetIt getit = GetIt.I;

  getit.registerSingleton<ProdutoDAO>(ProdutoDAOimple());
  getit.registerSingleton<ProdutoService>(ProdutoService());
}

import 'package:get_it/get_it.dart';
import 'package:wigtes_atividade/app/Database/sqlite/dao/produto_dao_imple.dart';

import 'dominio/interface/produto_dao.dart';

setupInjection() {
  GetIt getit = GetIt.I;

  getit.registerSingleton<ProdutoDAO>(ProdutoDAOimple());
}

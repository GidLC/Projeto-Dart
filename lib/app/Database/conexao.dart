import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:wigtes_atividade/app/Database/sqlite/script.dart';

class Conexao {
  static Database _bd = _bd;

  static String get createTable => '';

  static String get insert => '';

  static Future<Database> get() async {
    if (_bd == null) {
      var path = join(await getDatabasesPath(), 'bd_produtos');
      deleteDatabase(path);
      _bd = await openDatabase(
        path,
        version: 1,
        onCreate: (bd, v) {
          bd.execute(createTable);
          bd.execute(insert);
          bd.execute(insert);
          bd.execute(insert);
        },
      );
    }
    return _bd;
  }
}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:wigtes_atividade/app/Database/sqlite/script.dart';

class Conexao {
  static Database bd = bd;

  static String get createTable => '';

  static String get insert => '';

  static Future<Database> get() async {
    if (bd == null) {
      var path = join(await getDatabasesPath(), 'bd_produtos');
      bd = await openDatabase(
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
    return bd;
  }
}

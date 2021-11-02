import 'package:flutter/material.dart';
import 'package:wigtes_atividade/app/injection.dart';

import 'app/MyApp.dart';

void main() async {
  setupInjection();
  runApp(MyApp());

}

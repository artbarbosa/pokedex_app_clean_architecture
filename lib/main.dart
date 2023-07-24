import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_app/app/app_widget.dart';

import 'app/app_module.dart';
import 'app/core/shared/consts/store_consts.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Hive.initFlutter();
  await Hive.openBox(StoreConst.boxPokemon);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

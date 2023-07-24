import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/ui/home/controller/home_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<HomeController>((i) => HomeController(i(), i()), export: true),
  ];
}

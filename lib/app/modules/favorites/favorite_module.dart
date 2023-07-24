import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/ui/favorite/controller/favorite_controller.dart';

class FavoriteModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<FavoriteController>((i) => FavoriteController(i(), i()), export: true),
  ];
}

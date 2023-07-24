import 'package:flutter/cupertino.dart';

import '../../../consts/images/app_images.dart';
import '../../../utils/package_utils.dart';

class PokemonRefreshComponent extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const PokemonRefreshComponent({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => Image.asset(
        AppImages.pikloader,
        package: PackageUtils.pakcageImportName,
      ),
    );
  }
}

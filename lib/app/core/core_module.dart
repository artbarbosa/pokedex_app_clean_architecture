import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:pokedex_app/app/core/shared/services/local/hive_local_storage_service.dart';

import 'shared/consts/api_consts.dart';
import 'shared/services/local/local_storage_service_interface.dart';
import 'shared/services/remote/graphql_http_client.dart';
import 'shared/services/remote/http_client_service_interface.dart';
import 'shared/ui/controllers/custom_navigation_controller.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CustomNavigationController>((i) => CustomNavigationController(0),
            export: true),
        Bind.singleton<ILocalStorageService>((i) => HiveLocalStorageService(hive: Hive),
            export: true),
        Bind.singleton<IHttpClientService>(
          (i) => GraphqlHttpClientServiceImp(GraphQLClient(
            link: HttpLink(ApiConst.apiUrl),
            cache: GraphQLCache(),
          )),
          export: true,
        ),
      ];
}

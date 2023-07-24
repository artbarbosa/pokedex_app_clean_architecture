import 'package:graphql/client.dart';

import '../../failures/failures.dart';
import 'http_client_service_interface.dart';

class GraphqlHttpClientServiceImp implements IHttpClientService {
  final GraphQLClient _client;

  GraphqlHttpClientServiceImp(this._client);

  @override
  Future<QueryResult<TParsed>> query<TParsed>(String document) {
    try {
      return _client.query<TParsed>(QueryOptions(document: gql(document)));
    } catch (error, stackTrace) {
      throw GraphqlHttpClientError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}

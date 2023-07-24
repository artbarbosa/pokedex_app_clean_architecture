import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/shared/failures/failures.dart';
import 'package:pokedex_app/app/core/shared/services/remote/graphql_http_client.dart';

import '../../../../../mock/mock.dart';

void main() {
  late GraphqlHttpClientServiceImp clientService;
  late GraphQLClientMock graphQLClientMock;

  setUpAll(() {
    graphQLClientMock = GraphQLClientMock();
    clientService = GraphqlHttpClientServiceImp(graphQLClientMock);
  });

  test('Should throw  GraphqlHttpClientError', () async {
    when(() => graphQLClientMock.query(queryOptionsMock)).thenThrow(ExceptionMock());

    expect(() async => await clientService.query(''), throwsA(isA<GraphqlHttpClientError>()));
  });
}

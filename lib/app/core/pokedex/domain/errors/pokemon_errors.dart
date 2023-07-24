import '../../../../core/shared/failures/failures.dart';

abstract class PokemonError implements Failure {}

class PokemonInvalid extends PokemonError {}

class PokemonDatasourceInternetConnection implements NoInternetConnection {}

class PokemonDatasourceError extends Failure {
  PokemonDatasourceError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class PokemonRepositoryError extends Failure {
  PokemonRepositoryError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

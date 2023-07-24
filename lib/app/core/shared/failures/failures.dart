import 'package:flutter/material.dart';

abstract class Failure {
  Failure({
    String? errorMessage,
    StackTrace? stackTrace,
  }) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}

class UnknownError extends Failure {
  final String errorMessage;
  final StackTrace? stackTrace;

  UnknownError({
    this.errorMessage = 'Unknown Error',
    this.stackTrace,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
        );
}

class NoInternetConnection extends Failure {
  NoInternetConnection() : super(errorMessage: 'No Internet Connection');
}

class GraphqlHttpClientError extends Failure {
  GraphqlHttpClientError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

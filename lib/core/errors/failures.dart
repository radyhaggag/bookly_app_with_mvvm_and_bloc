import 'package:dio/dio.dart';

abstract class Failure {
  Failure(this.message);

  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout wit API Server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout wit API Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout wit API Server');
      case DioErrorType.badCertificate:
        return ServerFailure(
          'Bad certificate, Incorrect Validation Certificate please try again later',
        );
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response!.data,
        );
      case DioErrorType.cancel:
        return ServerFailure('Request to API canceled');
      case DioErrorType.connectionError:
        return ServerFailure('No internet connection');
      case DioErrorType.unknown:
        return ServerFailure('OOPS! Unknown error, Something went wrong!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      String? errorMessage = response['error']['message'];
      return ServerFailure(errorMessage.toString());
    } else if (statusCode == 404) {
      return ServerFailure('Request Not found, please try again!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error,please try again later');
    } else {
      return ServerFailure('OOPS! Unknown error, Something went wrong!');
    }
  }
}

class ErrorHandler {
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = ServerFailure.fromDioError(error);
    } else {
      failure = ServerFailure(error.toString());
    }
  }

  late Failure failure;
}

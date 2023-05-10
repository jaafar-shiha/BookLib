import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.cancel:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioErrorType.unknown:
        if (dioError.message?.contains('SocketException')??false) {
          return const ServerFailure('No Internet Connection');
        }
        return const ServerFailure('Unexpected Error, Please try again!');
      default:
        return const ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal Server error, Please try later');
    } else {
      return const ServerFailure('Opps There was an Error, Please try again');
    }
  }
}


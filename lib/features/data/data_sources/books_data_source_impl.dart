import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/api/api_services.dart';
import '../../../core/api/urls.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/sever_failure.dart';
import '../models/home/book/book_model.dart';
import 'books_data_source.dart';

class BooksDataSourceImpl extends BooksDataSource {
  final ApiService _apiService;

  BooksDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await _apiService.get(endPoint: URLs.featuredBooks);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromMap(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await _apiService.get(endPoint: URLs.newestBooks);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromMap(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

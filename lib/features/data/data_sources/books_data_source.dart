import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../models/home/book/book_model.dart';

abstract class BooksDataSource {

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}


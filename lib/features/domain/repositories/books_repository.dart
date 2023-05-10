import 'package:booklib/features/data/models/home/book/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BooksRepository{
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> getNewestBooks();
}
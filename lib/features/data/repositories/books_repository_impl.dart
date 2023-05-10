import 'package:booklib/core/error/failure.dart';
import 'package:booklib/features/data/models/home/book/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/books_repository.dart';
import '../data_sources/books_data_source.dart';

class BooksRepositoryImpl extends BooksRepository{
  final BooksDataSource booksDataSource;

  BooksRepositoryImpl({
    required this.booksDataSource,
  });

  @override
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks() async {
    return await booksDataSource.fetchFeaturedBooks();
  }

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    return await booksDataSource.fetchNewestBooks();
  }
}

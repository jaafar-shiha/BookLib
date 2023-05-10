import 'package:booklib/core/api/api_services.dart';
import 'package:booklib/features/domain/usecases/home/get_newest_books_usecase.dart';
import 'package:booklib/features/presentation/cubits/featured_books/featured_books_cubit.dart';
import 'package:booklib/features/presentation/cubits/newest_books/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/data_sources/books_data_source.dart';
import '../../features/data/data_sources/books_data_source_impl.dart';
import '../../features/data/repositories/books_repository_impl.dart';
import '../../features/domain/usecases/home/get_featured_books_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Dio
  final dio = Dio();
  sl.registerSingleton<Dio>(dio);

  ///cubit
  sl.registerFactory(() => FeaturedBooksCubit(
        sl<GetFeaturedBooksUseCase>(),
      ));
  sl.registerFactory(() => NewestBooksCubit(
    sl<GetNewestBooksUseCase>(),
  ));

  ///use case
  /////////auth
  sl.registerLazySingleton(() => GetFeaturedBooksUseCase(sl<BooksRepositoryImpl>()));
  sl.registerLazySingleton(() => GetNewestBooksUseCase(sl<BooksRepositoryImpl>()));

  ///repository
  sl.registerLazySingleton<BooksRepositoryImpl>(
    () => BooksRepositoryImpl(booksDataSource: sl<BooksDataSource>()),
  );

  ///remote data source
  sl.registerLazySingleton<BooksDataSource>(
    () => BooksDataSourceImpl(sl<ApiService>()),
  );

  /// services
  sl.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
}

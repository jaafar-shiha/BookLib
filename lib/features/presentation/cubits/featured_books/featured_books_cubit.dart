import 'package:booklib/features/domain/usecases/home/get_featured_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/usecases/base_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final GetFeaturedBooksUseCase _getFeaturedBooksUseCase;

  FeaturedBooksCubit(this._getFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  static FeaturedBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await _getFeaturedBooksUseCase(const NoParameters());
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

import 'package:booklib/features/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/base_use_case.dart';
import '../../../domain/usecases/home/get_newest_books_usecase.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final GetNewestBooksUseCase _getNewestBooksUseCase;

  NewestBooksCubit(this._getNewestBooksUseCase) : super(NewestBooksInitial());

  static NewestBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await _getNewestBooksUseCase(const NoParameters());
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}

import 'package:booklib/core/utils/app_text_style.dart';
import 'package:booklib/features/presentation/cubits/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/app_colors.dart';
import 'newest_book_card.dart';

class NewestBooks extends StatelessWidget {
  const NewestBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksFailure) {
          Fluttertoast.showToast(
              msg: state.errMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.grey,
              textColor: AppColors.white,
              fontSize: 15.0);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.black,
            ),
          );
        } else if (state is NewestBooksSuccess) {
          return Column(
            children: state.books
                .map(
                  (bookModel) => NewestBookCard(bookEntity: bookModel),
                )
                .toList(),
          );
        } else if (state is NewestBooksFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: GestureDetector(
              onTap: () => NewestBooksCubit.get(context).fetchNewestBooks(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text('Try again',style: AppTextStyle.latoSmallBoldBlack,),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.refresh)
        ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

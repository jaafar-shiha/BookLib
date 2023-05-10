import 'package:booklib/core/utils/app_text_style.dart';
import 'package:booklib/features/presentation/cubits/featured_books/featured_books_cubit.dart';
import 'package:booklib/features/presentation/views/home/widgets/featured_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/app_colors.dart';

class FeaturedBooks extends StatelessWidget {
  const FeaturedBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksFailure) {
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
        if (state is FeaturedBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.black,
            ),
          );

        } else if (state is FeaturedBooksSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.books
                  .map(
                    (bookEntity) => FeaturedBookCard(bookEntity: bookEntity),
                  )
                  .toList(),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: GestureDetector(
              onTap: () => FeaturedBooksCubit.get(context).fetchFeaturedBooks(),
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

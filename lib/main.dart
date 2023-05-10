import 'package:booklib/features/presentation/cubits/featured_books/featured_books_cubit.dart';
import 'package:booklib/features/presentation/cubits/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_router.dart';
import 'core/services/services_locator.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const BookLib());
}

class BookLib extends StatelessWidget {
  const BookLib({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<FeaturedBooksCubit>()..fetchFeaturedBooks()),
        BlocProvider(create: (context) => di.sl<NewestBooksCubit>()..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        title: 'Book library',
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:booklib/features/domain/entities/book_entity.dart';
import 'package:booklib/features/presentation/views/home/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/views/book_details/book_details_view.dart';
import 'app_routes.dart';

class AppRouter {
  static final List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.homeView,
      builder: (context, state) => const HomeView(),
    ),
  GoRoute(
      path: AppRoutes.bookDetailsView,
      builder: (context, state) =>  BookDetailsView(
        bookEntity: state.extra as BookEntity,
      ),
    ),
  ];
  static final router = GoRouter(
    routes: routes,
  );
}

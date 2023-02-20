import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/bloc/search_bloc.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../utils/service_locator.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<HomeBloc>()
            ..add(LoadFeaturedBooks())
            ..add(LoadNewestBooks()),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
          child: const SearchView(),
        ),
      ),
    ],
  );
}

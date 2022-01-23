import 'dart:io';

import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/search.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = new MyHttpOverrides();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // movies
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailRecommendationsCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchlistCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetWatchlistMoviesCubit>(),
        ),
        // tv series
        BlocProvider(
          create: (_) => di.locator<SearchTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesDetailRecommendationsCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesWatchlistCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetWatchlistTvSeriesCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme, colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case homeMoviesRoute:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case popularMoviesRoute:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case topRatedMoviesRoute:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchRoute:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case watchlistRoute:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case aboutRoute:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case homeTVSeriesRoute:
              return MaterialPageRoute(builder: (_) => TVSeriesPage());
            case popularTVSeriesRoute:
              return MaterialPageRoute(builder: (_) => PopularTVSeriesPage());
            case topRatedTVSeriesRoute:
              return MaterialPageRoute(builder: (_) => TopRatedTVSeriesPage());
            case tvSeriesDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVSeriesDetailPage(id: id),
                settings: settings,
              );
            case searchTVSeriesRoute:
              return CupertinoPageRoute(builder: (_) => TVSeriesSearchPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

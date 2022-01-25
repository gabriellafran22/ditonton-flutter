import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:search/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:search/search.dart';
import 'package:movies/movies.dart';
import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';
final locator = GetIt.instance;

void init() {
  // cubit
  // movies
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => MovieDetailRecommendationsCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => MovieWatchlistCubit(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
        () => GetWatchlistMoviesCubit(
      locator(),
    ),
  );
  //tv series
  locator.registerFactory(
    () => SearchTvSeriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
        () => NowPlayingTvSeriesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => PopularTvSeriesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TopRatedTvSeriesCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesDetailCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesDetailRecommendationsCubit(
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesWatchlistCubit(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
        () => GetWatchlistTvSeriesCubit(
      locator(),
    ),
  );

  // use case
  //movies
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  //tv series
  locator.registerLazySingleton(() => GetNowPlayingTVSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVSeries(locator()));
  locator.registerLazySingleton(() => GetTVSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTVSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTVSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTVSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTVSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTVSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVSeries(locator()));

  // repository
  //movies
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  //tv series
  locator.registerLazySingleton<TVSeriesRepository>(
        () => TVSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  //movies
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  //tv series
  locator.registerLazySingleton<TVSeriesRemoteDataSource>(
      () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVSeriesLocalDataSource>(
      () => TVSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}

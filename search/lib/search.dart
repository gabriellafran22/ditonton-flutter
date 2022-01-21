library search;

// domain
// domain -> usecases
export 'domain/usecases/search_movies.dart';
export 'domain/usecases/search_tv_series.dart';

// presentation
// presentation -> provider
export 'presentation/provider/movie_search_notifier.dart';
export 'presentation/provider/tv_series_search_notifier.dart';
// presentation -> pages
export 'presentation/pages/search_page.dart';
export 'presentation/pages/tv_series_search.dart';
// presentation -> bloc
export 'presentation/bloc/search_movies/search_movies_bloc.dart';
export 'presentation/bloc/search_tv_series/search_tv_series_bloc.dart';
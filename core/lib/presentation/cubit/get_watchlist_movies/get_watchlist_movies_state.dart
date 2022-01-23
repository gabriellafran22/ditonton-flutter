part of 'get_watchlist_movies_cubit.dart';

class GetWatchlistMoviesState extends Equatable {
  const GetWatchlistMoviesState();

  @override
  List<Object> get props => [];
}

class GetWatchlistMoviesEmpty extends GetWatchlistMoviesState {}

class GetWatchlistMoviesLoading extends GetWatchlistMoviesState {}

class GetWatchlistMoviesError extends GetWatchlistMoviesState {
  final String message;

  const GetWatchlistMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetWatchlistMoviesHasData extends GetWatchlistMoviesState {
  final List<Movie> result;

  const GetWatchlistMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
